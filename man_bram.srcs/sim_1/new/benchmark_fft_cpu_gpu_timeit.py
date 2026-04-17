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
    parser.add_argument("--repeat", type=int, default=100, help="How many timing repeats to run.")
    parser.add_argument("--number", type=int, default=50, help="Iterations per repeat.")
    parser.add_argument(
        "--gpu",
        choices=("auto", "on", "off"),
        default="auto",
        help="GPU benchmark mode: auto (default), on (require GPU), off (CPU only).",
    )
    parser.add_argument("--rtol", type=float, default=1e-12, help="Relative tolerance for CPU/GPU comparison.")
    parser.add_argument("--atol", type=float, default=1e-12, help="Absolute tolerance for CPU/GPU comparison.")
    parser.add_argument("--seed", type=int, default=12345, help="Seed for deterministic input generation.")
    return parser.parse_args()


def build_input(np_mod: Any, n: int, seed: int):
    rng = np_mod.random.default_rng(seed)
    real = rng.standard_normal(n, dtype=np_mod.float64)
    imag = np_mod.zeros(n, dtype=np_mod.float64)
    return (real + 1j * imag).astype(np_mod.complex128, copy=False)


def filtered_mean(values: list[float], trim_fraction: float = 0.10) -> tuple[float, list[float], int]:
    if not values:
        raise ValueError("values must be non-empty")

    sorted_vals = sorted(float(v) for v in values)
    n = len(sorted_vals)
    trim_each = int(n * trim_fraction)

    # Keep at least one sample even when repeat is very small.
    max_trim = (n - 1) // 2
    trim_each = min(trim_each, max_trim)

    if trim_each > 0:
        filtered_vals = sorted_vals[trim_each : n - trim_each]
    else:
        filtered_vals = sorted_vals

    dropped = n - len(filtered_vals)
    return float(sum(filtered_vals) / len(filtered_vals)), filtered_vals, dropped


def benchmark_cpu(np_mod: Any, x_cpu, warmup: int, repeat: int, number: int):
    def run_fft_cpu() -> None:
        np_mod.fft.fft(x_cpu, norm="backward")

    for _ in range(warmup):
        run_fft_cpu()

    timer = timeit.Timer(run_fft_cpu)
    results_sec = timer.repeat(repeat=repeat, number=number)
    per_call_ns = [(sec / number) * 1e9 for sec in results_sec]
    filtered_avg_ns, filtered_ns, dropped = filtered_mean(per_call_ns)
    return filtered_avg_ns, per_call_ns, filtered_ns, dropped


def benchmark_gpu(np_mod: Any, x_cpu, warmup: int, repeat: int, number: int):
    try:
        import cupy as cp  # type: ignore[import-not-found]
    except KeyboardInterrupt:
        return None, None, None, None, None, (
            "GPU setup interrupted while importing CuPy. "
            "Run with '--gpu off' to skip GPU benchmarking."
        )
    except Exception as exc:
        return None, None, None, None, None, (
            "CuPy is not available. Install with 'pip install cupy-cuda12x' "
            "(or the wheel matching your CUDA version)."
            f"\nImport error: {exc}"
        )

    try:
        device_count = cp.cuda.runtime.getDeviceCount()
        if device_count < 1:
            return None, None, None, None, None, "CUDA device not detected. Ensure an NVIDIA GPU and CUDA driver are installed."
    except KeyboardInterrupt:
        return None, None, None, None, None, (
            "GPU setup interrupted while probing CUDA runtime. "
            "Run with '--gpu off' to skip GPU benchmarking."
        )
    except Exception as exc:
        return None, None, None, None, None, (
            "CUDA runtime is not accessible. Verify NVIDIA driver/CUDA installation."
            f"\nRuntime error: {exc}"
        )

    def run_fft_gpu() -> None:
        x_gpu = cp.asarray(x_cpu, dtype=cp.complex128)
        cp.fft.fft(x_gpu, norm="backward")

    try:
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
    except KeyboardInterrupt:
        return None, None, None, None, None, (
            "GPU benchmark interrupted. Run with '--gpu off' to skip GPU benchmarking."
        )
    except Exception as exc:
        return None, None, None, None, None, f"GPU benchmark failed: {exc}"

    filtered_avg_ns, filtered_ns, dropped = filtered_mean(per_call_ns)
    return filtered_avg_ns, per_call_ns, filtered_ns, dropped, (y_cpu, y_gpu), None


def compare_accuracy(np_mod: Any, y_cpu, y_gpu, rtol: float, atol: float) -> tuple[bool, float, float]:
    y_cpu_arr = np_mod.asarray(y_cpu)
    y_gpu_arr = np_mod.asarray(y_gpu)

    diff = y_cpu_arr - y_gpu_arr
    abs_diff = np_mod.abs(diff)

    close = bool(np_mod.allclose(y_cpu_arr, y_gpu_arr, rtol=rtol, atol=atol))
    max_abs_err = float(np_mod.max(abs_diff))
    mean_abs_err = float(np_mod.mean(abs_diff))
    rms_err = float(np_mod.sqrt(np_mod.mean(abs_diff**2)))
    l2_err = float(np_mod.linalg.norm(diff.ravel()))

    signal_l2 = float(np_mod.linalg.norm(y_cpu_arr.ravel()))
    if l2_err == 0.0:
        snr_db = float("inf")
    elif signal_l2 == 0.0:
        snr_db = float("-inf")
    else:
        snr_db = float(20.0 * np_mod.log10(signal_l2 / l2_err))

    if snr_db == float("inf"):
        snr_str = "inf"
    elif snr_db == float("-inf"):
        snr_str = "-inf"
    else:
        snr_str = f"{snr_db:.3f}"

    print(
        f"Equivalence check: {close} "
        f"(rtol={rtol}, atol={atol}, max_abs_err={max_abs_err:.3e})"
    )
    print(
        "Accuracy metrics: "
        f"rms_err={rms_err:.3e}, "
        f"max_abs_err={max_abs_err:.3e}, "
        f"mean_abs_err={mean_abs_err:.3e}, "
        f"l2_err={l2_err:.3e}, "
        f"snr_db={snr_str}"
    )

    return close, max_abs_err, rms_err


def print_summary_row(n: int, cpu_filtered_avg_ns: float, gpu_filtered_avg_ns: float | None, max_abs_err: float | None, rms_err: float | None):
    speedup_str = "N/A"
    if gpu_filtered_avg_ns is not None and gpu_filtered_avg_ns > 0.0:
        speedup_str = f"{(cpu_filtered_avg_ns / gpu_filtered_avg_ns):.3f}x"

    gpu_str = "N/A" if gpu_filtered_avg_ns is None else f"{gpu_filtered_avg_ns:.3f}"
    max_str = "N/A" if max_abs_err is None else f"{max_abs_err:.3e}"
    rms_str = "N/A" if rms_err is None else f"{rms_err:.3e}"

    print(
        f"N={n:<6} "
        f"CPU={cpu_filtered_avg_ns:>12.3f} ns "
        f"GPU={gpu_str:>12} ns "
        f"Speedup={speedup_str:>8} "
        f"MaxErr={max_str:>12} "
        f"RMSErr={rms_str:>12}"
    )


def plot_speed(
    np_mod: Any,
    cpu_all_ns: list[float],
    cpu_filtered_avg_ns: float,
    gpu_all_ns: list[float] | None,
    gpu_filtered_avg_ns: float | None,
    speed_path: str,
) -> None:
    import matplotlib.pyplot as plt  # type: ignore[import-not-found]

    run_idx = list(range(1, len(cpu_all_ns) + 1))

    fig, ax = plt.subplots(figsize=(10, 6))
    ax.plot(run_idx, cpu_all_ns, marker="o", linestyle="-", linewidth=1.5, markersize=4, label="CPU raw run")
    ax.axhline(cpu_filtered_avg_ns, linestyle="--", linewidth=2, color="tab:blue", alpha=0.8, label="CPU filtered average")

    if gpu_all_ns is not None and gpu_filtered_avg_ns is not None:
        ax.plot(run_idx, gpu_all_ns, marker="s", linestyle="-", linewidth=1.5, markersize=4, label="GPU raw run")
        ax.axhline(gpu_filtered_avg_ns, linestyle="--", linewidth=2, color="tab:orange", alpha=0.8, label="GPU filtered average")

    ax.set_xlabel("Run index")
    ax.set_ylabel("Time per FFT (ns)")
    ax.set_title("Execution Times vs Run Index")
    ax.grid(True, alpha=0.3)
    ax.legend(loc="best")

    fig.tight_layout()
    fig.savefig(speed_path, dpi=150)
    plt.close(fig)


def plot_accuracy(np_mod: Any, max_abs_err: float | None, rms_err: float | None, accuracy_path: str) -> None:
    import matplotlib.pyplot as plt  # type: ignore[import-not-found]

    fig, ax = plt.subplots(figsize=(8, 5))
    has_max = max_abs_err is not None and np_mod.isfinite(max_abs_err)
    has_rms = rms_err is not None and np_mod.isfinite(rms_err)

    if has_max or has_rms:
        labels: list[str] = []
        values: list[float] = []
        if has_max and max_abs_err is not None:
            labels.append("Max Abs Error")
            values.append(float(max_abs_err))
        if has_rms and rms_err is not None:
            labels.append("RMS Error")
            values.append(float(rms_err))

        ax.bar(labels, values, color=["tab:red", "tab:green"][: len(values)], alpha=0.85)
        ax.set_yscale("log")
    else:
        ax.text(
            0.5,
            0.5,
            "No GPU accuracy data available",
            transform=ax.transAxes,
            ha="center",
            va="center",
            fontsize=11,
            color="gray",
        )

    ax.set_xlabel("Metric")
    ax.set_ylabel("Error")
    ax.set_title("CPU vs GPU Accuracy Metrics (single N)")
    ax.grid(True, which="both", alpha=0.3, axis="y")

    fig.tight_layout()
    fig.savefig(accuracy_path, dpi=150)
    plt.close(fig)


def main() -> int:
    args = parse_args()

    try:
        import numpy as np
    except Exception as exc:
        print("ERROR: NumPy is required. Install with: pip install numpy")
        print(f"Import error: {exc}")
        return 1

    try:
        import matplotlib.pyplot as _plt  # type: ignore[import-not-found]
    except Exception as exc:
        print("ERROR: matplotlib is required for graph output. Install with: pip install matplotlib")
        print(f"Import error: {exc}")
        return 1
    finally:
        # Avoid unused import warnings while still validating availability.
        if "_plt" in locals():
            del _plt

    if args.n <= 0:
        print("ERROR: --n must be > 0")
        return 2
    if args.warmup < 0 or args.repeat <= 0 or args.number <= 0:
        print("ERROR: --warmup must be >= 0, and --repeat/--number must be > 0")
        return 2

    n = args.n

    print(
        f"n={n}, "
        f"dtype=complex128, norm='backward', warmup={args.warmup}, "
        f"repeat={args.repeat}, number={args.number}, seed={args.seed}, "
        f"gpu_timing='H2D transfer + FFT', outlier_filter='drop top/bottom 10% then mean'"
    )

    gpu_enabled = args.gpu != "off"
    gpu_err_global: str | None = "GPU benchmarking disabled by --gpu off" if args.gpu == "off" else None
    accuracy_failed = False

    print("\nFFT Benchmark Summary (filtered average nanoseconds per FFT call)")
    print("-" * 120)

    x_cpu = build_input(np, n, args.seed)

    cpu_filtered_avg_ns, cpu_all_ns, cpu_filtered_ns, cpu_dropped = benchmark_cpu(
        np_mod=np,
        x_cpu=x_cpu,
        warmup=args.warmup,
        repeat=args.repeat,
        number=args.number,
    )

    print(f"\nN={n} CPU repeats raw (ns): {[round(v, 3) for v in cpu_all_ns]}")
    print(f"N={n} CPU repeats filtered (ns, dropped={cpu_dropped}): {[round(v, 3) for v in cpu_filtered_ns]}")

    gpu_filtered_avg_ns: float | None = None
    gpu_all_ns: list[float] | None = None
    max_abs_err: float | None = None
    rms_err: float | None = None

    if gpu_enabled:
        gpu_filtered_avg_ns, gpu_all_ns, gpu_filtered_ns, gpu_dropped, pair, gpu_err = benchmark_gpu(
            np_mod=np,
            x_cpu=x_cpu,
            warmup=args.warmup,
            repeat=args.repeat,
            number=args.number,
        )

        if gpu_err is not None:
            gpu_err_global = gpu_err
            print("GPU repeats (ns): N/A")
            print(f"GPU unavailable: {gpu_err_global}")
            gpu_enabled = False
            if args.gpu == "on":
                print_summary_row(n, cpu_filtered_avg_ns, None, None, None)
                return 1
        else:
            print(f"GPU repeats raw (ns): {[round(v, 3) for v in gpu_all_ns]}" )
            print(f"GPU repeats filtered (ns, dropped={gpu_dropped}): {[round(v, 3) for v in gpu_filtered_ns]}")
            if pair is not None:
                y_cpu, y_gpu = pair
                close, max_abs_err, rms_err = compare_accuracy(np, y_cpu, y_gpu, rtol=args.rtol, atol=args.atol)
                if not close:
                    accuracy_failed = True
                    print("WARNING: CPU and GPU FFT outputs differ beyond tolerance.")
    elif gpu_err_global is not None:
        print("GPU repeats (ns): N/A")
        print(f"GPU unavailable: {gpu_err_global}")

    print_summary_row(n, cpu_filtered_avg_ns, gpu_filtered_avg_ns, max_abs_err, rms_err)

    speed_path = "benchmark_fft_speed.png"
    accuracy_path = "benchmark_fft_accuracy.png"

    plot_speed(np, cpu_all_ns, cpu_filtered_avg_ns, gpu_all_ns, gpu_filtered_avg_ns, speed_path)
    plot_accuracy(np, max_abs_err, rms_err, accuracy_path)

    print("\nSaved plots:")
    print(f"- {speed_path}")
    print(f"- {accuracy_path}")

    if accuracy_failed:
        print("\nERROR: One or more FFT sizes failed CPU/GPU tolerance checks.")
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
