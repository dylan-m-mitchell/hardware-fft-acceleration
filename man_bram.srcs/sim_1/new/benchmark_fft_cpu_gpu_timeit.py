from __future__ import annotations

"""Benchmark equivalent CPU and GPU FFT execution times in nanoseconds.

CPU timing uses Python's timeit module.
GPU timing uses CUDA events and synchronization to correctly account for async execution.
"""

import argparse
import sys
import timeit
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Benchmark equivalent NumPy (CPU) and CuPy (GPU) FFT timings."
    )
    parser.add_argument("--n", type=int, default=32, help="FFT length.")
    parser.add_argument("--warmup", type=int, default=10, help="Warmup iterations before timing.")
    parser.add_argument("--repeat", type=int, default=5, help="How many timing repeats to run.")
    parser.add_argument("--number", type=int, default=50, help="Iterations per repeat.")
    parser.add_argument("--rtol", type=float, default=1e-12, help="Relative tolerance for CPU/GPU comparison.")
    parser.add_argument("--atol", type=float, default=1e-12, help="Absolute tolerance for CPU/GPU comparison.")
    parser.add_argument("--seed", type=int, default=12345, help="Seed for deterministic input generation.")
    return parser.parse_args()


def build_input(np_mod: Any, n: int, seed: int):
    rng = np_mod.random.default_rng(seed)
    real = rng.standard_normal(n, dtype=np_mod.float64)
    imag = np_mod.zeros(n, dtype=np_mod.float64)
    return (real + 1j * imag).astype(np_mod.complex128, copy=False)


def benchmark_cpu(np_mod: Any, x_cpu, warmup: int, repeat: int, number: int):
    def run_fft_cpu() -> None:
        np_mod.fft.fft(x_cpu, norm="backward")

    for _ in range(warmup):
        run_fft_cpu()

    timer = timeit.Timer(run_fft_cpu)
    results_sec = timer.repeat(repeat=repeat, number=number)
    per_call_ns = [(sec / number) * 1e9 for sec in results_sec]
    return min(per_call_ns), per_call_ns


def benchmark_gpu(np_mod: Any, x_cpu, warmup: int, repeat: int, number: int):
    try:
        import cupy as cp  # type: ignore[import-not-found]
    except Exception as exc:
        return None, None, None, (
            "CuPy is not available. Install with 'pip install cupy-cuda12x' "
            "(or the wheel matching your CUDA version)."
            f"\nImport error: {exc}"
        )

    try:
        device_count = cp.cuda.runtime.getDeviceCount()
        if device_count < 1:
            return None, None, None, "CUDA device not detected. Ensure an NVIDIA GPU and CUDA driver are installed."
    except Exception as exc:
        return None, None, None, (
            "CUDA runtime is not accessible. Verify NVIDIA driver/CUDA installation."
            f"\nRuntime error: {exc}"
        )

    def run_fft_gpu() -> None:
        x_gpu = cp.asarray(x_cpu, dtype=cp.complex128)
        cp.fft.fft(x_gpu, norm="backward")

    for _ in range(warmup):
        run_fft_gpu()
    cp.cuda.Stream.null.synchronize()

    per_call_ns = []
    for _ in range(repeat):
        start_evt = cp.cuda.Event()
        end_evt = cp.cuda.Event()

        start_evt.record()
        for _ in range(number):
            run_fft_gpu()
        end_evt.record()
        end_evt.synchronize()

        elapsed_ms = cp.cuda.get_elapsed_time(start_evt, end_evt)
        per_call_ns.append((float(elapsed_ms) * 1e6) / number)

    y_cpu = np_mod.fft.fft(x_cpu, norm="backward")
    y_gpu = cp.asnumpy(cp.fft.fft(cp.asarray(x_cpu, dtype=cp.complex128), norm="backward"))

    return min(per_call_ns), per_call_ns, (y_cpu, y_gpu), None


def print_summary(cpu_best_ns, gpu_best_ns):
    if gpu_best_ns is not None and gpu_best_ns > 0.0:
        speedup = cpu_best_ns / gpu_best_ns
        speedup_str = f"{speedup:.3f}x"
    else:
        speedup_str = "N/A"

    print("\nFFT Benchmark Summary (nanoseconds per FFT call)")
    print("-" * 58)
    print(f"{'CPU best ns':<20} {cpu_best_ns:>18.3f}")
    if gpu_best_ns is None:
        print(f"{'GPU best ns':<20} {'N/A':>18}")
    else:
        print(f"{'GPU best ns':<20} {gpu_best_ns:>18.3f}")
    print(f"{'Speedup (CPU/GPU)':<20} {speedup_str:>18}")


def main() -> int:
    args = parse_args()

    try:
        import numpy as np
    except Exception as exc:
        print("ERROR: NumPy is required. Install with: pip install numpy")
        print(f"Import error: {exc}")
        return 1

    if args.n <= 0:
        print("ERROR: --n must be > 0")
        return 2
    if args.warmup < 0 or args.repeat <= 0 or args.number <= 0:
        print("ERROR: --warmup must be >= 0, and --repeat/--number must be > 0")
        return 2

    x_cpu = build_input(np, args.n, args.seed)

    cpu_best_ns, cpu_all_ns = benchmark_cpu(
        np_mod=np,
        x_cpu=x_cpu,
        warmup=args.warmup,
        repeat=args.repeat,
        number=args.number,
    )

    gpu_best_ns, gpu_all_ns, pair, gpu_err = benchmark_gpu(
        np_mod=np,
        x_cpu=x_cpu,
        warmup=args.warmup,
        repeat=args.repeat,
        number=args.number,
    )

    print(
        f"n={args.n}, dtype=complex128, norm='backward', warmup={args.warmup}, "
        f"repeat={args.repeat}, number={args.number}, seed={args.seed}, "
        f"gpu_timing='H2D transfer + FFT'"
    )
    print(f"CPU repeats (ns): {[round(v, 3) for v in cpu_all_ns]}")

    if gpu_err is not None:
        print(f"GPU repeats (ns): N/A")
        print(f"GPU unavailable: {gpu_err}")
        print_summary(cpu_best_ns, None)
        return 0

    print(f"GPU repeats (ns): {[round(v, 3) for v in gpu_all_ns]}")

    y_cpu, y_gpu = pair
    close = np.allclose(y_cpu, y_gpu, rtol=args.rtol, atol=args.atol)
    max_abs_err = float(np.max(np.abs(y_cpu - y_gpu)))
    print(
        f"Equivalence check: {close} "
        f"(rtol={args.rtol}, atol={args.atol}, max_abs_err={max_abs_err:.3e})"
    )

    if not close:
        print("ERROR: CPU and GPU FFT outputs differ beyond tolerance.")
        print_summary(cpu_best_ns, gpu_best_ns)
        return 1

    print_summary(cpu_best_ns, gpu_best_ns)
    return 0


if __name__ == "__main__":
    sys.exit(main())
