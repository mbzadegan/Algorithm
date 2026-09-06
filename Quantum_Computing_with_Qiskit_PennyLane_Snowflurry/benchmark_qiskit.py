#!/usr/bin/env python3
"""Statevector benchmark for Qiskit Statevector."""

import gc
import statistics
import sys
import time

import numpy as np
import qiskit
from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector


def parameters():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 14
    depth = int(sys.argv[2]) if len(sys.argv) > 2 else 8
    repeats = int(sys.argv[3]) if len(sys.argv) > 3 else 10
    if n < 2 or depth < 1 or repeats < 1:
        raise ValueError("Use qubits >= 2, depth >= 1, repeats >= 1")
    return n, depth, repeats


def build_circuit(n, depth):
    circuit = QuantumCircuit(n)
    for layer in range(1, depth + 1):
        for q in range(n):
            theta = 0.017 * (3 * layer + q + 1)
            circuit.rx(theta, q)
            circuit.ry(theta / 2.0, q)
            circuit.rz(-theta / 3.0, q)
        for q in range(n - 1):
            circuit.cx(q, q + 1)
        circuit.cx(n - 1, 0)
    return circuit


def main():
    n, depth, repeats = parameters()

    t0 = time.perf_counter()
    circuit = build_circuit(n, depth)
    build_s = time.perf_counter() - t0

    t0 = time.perf_counter()
    state = Statevector.from_instruction(circuit).data
    cold_s = time.perf_counter() - t0

    # One untimed execution ensures lazy initialization is complete.
    _ = Statevector.from_instruction(circuit)

    samples = []
    for _ in range(repeats):
        gc.collect()
        t0 = time.perf_counter()
        state = Statevector.from_instruction(circuit).data
        samples.append(time.perf_counter() - t0)

    print(f"framework=Qiskit version={qiskit.__version__}")
    print(f"qubits={n} depth={depth} gates={circuit.size()} repeats={repeats}")
    print(f"build_s={build_s:.9f}")
    print(f"cold_run_s={cold_s:.9f}")
    print(f"warm_median_s={statistics.median(samples):.9f}")
    print(f"warm_mean_s={statistics.fmean(samples):.9f}")
    print(f"warm_min_s={min(samples):.9f}")
    print(f"p_all_zero={abs(state[0])**2:.12f}")
    print(f"state_norm={np.vdot(state, state).real:.12f}")


if __name__ == "__main__":
    main()
