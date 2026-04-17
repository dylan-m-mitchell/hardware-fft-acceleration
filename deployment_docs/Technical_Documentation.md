# Technical Documentation

## Architecture diagrams of the system

The following ASCII block diagram outlines the high-level architecture of the Hardware FFT Acceleration system, showing the data flow between the host PC (Software) and the FPGA (Hardware).

```text
===================================================================
                         HOST PC (SOFTWARE)
===================================================================
   [ Numpy / CuPy Data Gen ] <---> [ Python Benchmark / TB ]
                                              |
                                              v
                                   [ PySerial / UART Port ]
                                              |
==============================================|====================
                                        UART (TX/RX)
==============================================|====================
                         FPGA (HARDWARE)      |
==============================================|====================
                                              v
   [ UART TX ] <------------------------ [ UART RX ]
        ^                                     |
        | (Serialized Data)                   | (Packed 128-bit)
        |                                     v
 [ Output BRAM ]                         [ Input BRAM 128 ]
        ^                                     |
        | (AXI Stream)                        | (Complex Data)
        |                                     v
[ FFT 32 Co-Processor ] <--------------- [ RAM to FFT Bridge ]
                            (AXI Stream)
===================================================================
```

## File navigation information

The project repository is structured into several key directories based on the Xilinx Vivado project format and custom source groupings:

* **`/man_bram.srcs/sources_1/`**: Contains the core hardware Verilog/VHDL source files.
  * `/new/`: Custom user hardware modules (`DummyFFT.v`, `RAM_2Port.v`, `ToUART.v`, etc.)
  * `/imports/`: External or imported hardware IP blocks.
* **`/man_bram.srcs/sim_1/`**: Contains all software testbenches and simulation sources.
  * `/new/`: Python benchmarking utilities (`benchmark_fft_cpu_gpu_timeit.py`, `send.py`), as well as Verilog testbenches (`fft_32_tb.v`, `ram_to_fft256_bridge_tb.v`).
* **`/man_bram.srcs/constrs_1/`**: Contains the physical constraints files (e.g., `pins.xdc`) for FPGA deployment mapping.
* **`/man_bram.hw/`** & **`/man_bram.ip_user_files/`**: Vivado-generated directories for hardware execution blocks, IP configurations, and generated simulation scripts.
* **`/deployment_docs/`**: Generated documentation, architecture diagrams, and presentation materials.
* **Root Files**: Includes the top-level Vivado project (`man_bram.xpr`), `README.md`, and license files.

## Installation process

### 1. Hardware Initialization
1. Ensure **Xilinx Vivado** is installed.
2. Clone the repository to the local machine.
3. Open Vivado and load the `man_bram.xpr` project file.
4. Run "Generate Bitstream" to synthesize and implement the hardware design.
5. Open the Hardware Manager and target your connected FPGA board to program the `.bit` file.

### 2. Software / Environment Setup
1. Ensure **Python 3.10+** is installed on the host PC.
2. Open a terminal in the repository root and create a virtual environment:
   ```bash
   python -m venv .venv
   .\.venv\Scripts\Activate.ps1
   ```
3. Install the required Python packages:
   ```bash
   pip install numpy matplotlib pyserial
   ```
4. *Optional (for GPU Benchmarking)*: Install CUDA requirements and CuPy:
   ```bash
   pip install cupy-cuda12x
   ```

## Licenses

This project is governed by the licenses stored in the repository root:
* **Project License**: See the `LICENSE` file for the primary distribution rights and warranty disclaimers of this codebase.
* **Third-Party Licenses**: See `THIRD_PARTY_LICENSES.md` for attributions, copyright notices, and license terms pertaining to externally integrated IP or open-source libraries used within the hardware/software stacks.

## Libraries - including source and version

The software testing and validation suite relies on the following key libraries:

| Library | Version | Source | Purpose |
| :--- | :--- | :--- | :--- |
| **NumPy** | `1.26+` (Typical) | PyPI (`numpy`) | Host CPU complex number generation, standard CPU FFT reference calculation, matrix operations. |
| **CuPy** | `13.x+` (Typical) | PyPI (`cupy-cuda12x`) | GPU-accelerated FFT calculation for baseline timing and accuracy comparisons. |
| **Matplotlib** | `3.8+` (Typical) | PyPI (`matplotlib`) | Generating visual validation graphs (Speedup, Accuracy metrics). |
| **PySerial** | `3.5+` | PyPI (`pyserial`) | (Implicit via `send.py`) Serial UART communication between the Host PC and the FPGA. |

## API / SDK - including source and version

The development and deployment workflows depend on the following SDKs and toolchains:

* **Xilinx Vivado Design Suite**: `v2022.x` / `v2023.x` (or currently targeted version). Provides the synthesis compiler, IP Integrator (AXI stream interfaces), and Hardware Manager for FPGA deployment.
* **NVIDIA CUDA Toolkit**: `v12.x` (Required if running CuPy metrics). Provides the runtime and `cufft` binaries for GPU benchmarking evaluations.
* **Python API**: Provides the testbench automation API (`argparse`, `timeit`, `subprocess`) used to validate hardware behavior against software equivalents.
