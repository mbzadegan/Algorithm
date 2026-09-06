# PennyLane vs Qiskit vs Snowflurry benchmark

This benchmark evolves the all-zero state through the same parameterized
statevector circuit in all three frameworks. Each of `depth` layers contains
RX, RY and RZ on every qubit, followed by a ring of CNOT gates. Therefore each
program executes exactly `4 * qubits * depth` gates.

The default problem has 14 qubits, depth 8, 448 gates, and 10 timed repetitions.
It is deliberately small enough for a laptop. All runs are ideal local
statevector simulations: no quantum hardware, network access, shots, noise,
transpilation, gradients, or optimizer is involved.

## Install

Use Python 3.11 or newer in a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip pennylane qiskit
```

Install Julia, then install the stable Snowflurry release from the Julia REPL:

```julia
import Pkg
Pkg.add("Snowflurry")
```

## Run

From this directory:

```bash
chmod +x run_benchmarks.sh
./run_benchmarks.sh
```

Or run each implementation separately:

```bash
python3 benchmark_pennylane.py 14 8 10
python3 benchmark_qiskit.py 14 8 10
julia benchmark_snowflurry.jl 14 8 10
```

The three arguments are `qubits depth repeats`. Start with the defaults. If all
runs are short, try `16 10 10`, then `18 10 7`. Statevector memory and work grow
exponentially with the qubit count, so do not increase it aggressively.

## Interpret the output

- `build_s`: constructs the circuit representation only.
- `cold_run_s`: first simulation; especially for Julia this includes JIT work.
- `warm_median_s`: median warmed-up simulation time. This is the primary result.
- `warm_mean_s` and `warm_min_s`: supporting timing statistics.
- `whole_process_wall_s`: interpreter startup, imports, construction, and all
  runs; printed by the shell runner.
- `p_all_zero` and `state_norm`: correctness checks. The three `p_all_zero`
  values should agree within floating-point error, and every norm should be
  approximately 1.

Close heavy applications, connect the laptop to power, use the same performance
mode, and run the full suite at least three times. Report framework/package
versions, CPU, operating system, qubits, depth, gate count, and warm median.

This is a framework-level benchmark, not a pure Python-versus-Julia language
benchmark. The packages use different algorithms and implementation layers.
