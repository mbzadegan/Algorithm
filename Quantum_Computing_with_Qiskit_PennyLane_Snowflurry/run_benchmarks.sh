#!/usr/bin/env bash
set -euo pipefail

QUBITS="${1:-14}"
DEPTH="${2:-8}"
REPEATS="${3:-10}"

# Fix common numerical backends to one thread for a reproducible single-core test.
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export JULIA_NUM_THREADS=1

echo "==== PennyLane ===="
/usr/bin/time -f "whole_process_wall_s=%e" \
    python3 benchmark_pennylane.py "$QUBITS" "$DEPTH" "$REPEATS"

echo
echo "==== Qiskit ===="
/usr/bin/time -f "whole_process_wall_s=%e" \
    python3 benchmark_qiskit.py "$QUBITS" "$DEPTH" "$REPEATS"

echo
echo "==== Snowflurry ===="
/usr/bin/time -f "whole_process_wall_s=%e" \
    julia benchmark_snowflurry.jl "$QUBITS" "$DEPTH" "$REPEATS"
