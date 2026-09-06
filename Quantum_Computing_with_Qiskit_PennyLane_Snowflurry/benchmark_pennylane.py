#!/usr/bin/env python3
"""Statevector benchmark for PennyLane default.qubit."""

import gc
import statistics
import sys
import time

import numpy as np
import pennylane as qml


def parameters():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 14
    depth = int(sys.argv[2]) if len(sys.argv) > 2 else 8
    repeats = int(sys.argv[3]) if len(sys.argv) > 3 else 10
    if n < 2 or depth < 1 or repeats < 1:
        raise ValueError("Use qubits >= 2, depth >= 1, repeats >= 1")
    return n, depth, repeats


def build_circuit(n, depth):
    operations = []
    for layer in range(1, depth + 1):
        for q in range(n):
            theta = 0.017 * (3 * layer + q + 1)
            operations.extend(
                [
                    qml.RX(theta, wires=q),
                    qml.RY(theta / 2.0, wires=q),
                    qml.RZ(-theta / 3.0, wires=q),
                ]
            )
        for q in range(n - 1):
            operations.append(qml.CNOT(wires=[q, q + 1]))
        operations.append(qml.CNOT(wires=[n - 1, 0]))
    return qml.tape.QuantumScript(operations, [qml.state()])


def main():
    n, depth, repeats = parameters()

    t0 = time.perf_counter()
    tape = build_circuit(n, depth)
    device = qml.device("default.qubit", wires=n, shots=None)
    build_s = time.perf_counter() - t0

    t0 = time.perf_counter()
    state = np.asarray(device.execute(tape))
    cold_s = time.perf_counter() - t0

    # One untimed execution ensures lazy initialization is complete.
    _ = device.execute(tape)

    samples = []
    for _ in range(repeats):
        gc.collect()
        t0 = time.perf_counter()
        state = np.asarray(device.execute(tape))
        samples.append(time.perf_counter() - t0)

    print(f"framework=PennyLane version={qml.__version__}")
    print(f"qubits={n} depth={depth} gates={len(tape.operations)} repeats={repeats}")
    print(f"build_s={build_s:.9f}")
    print(f"cold_run_s={cold_s:.9f}")
    print(f"warm_median_s={statistics.median(samples):.9f}")
    print(f"warm_mean_s={statistics.fmean(samples):.9f}")
    print(f"warm_min_s={min(samples):.9f}")
    print(f"p_all_zero={abs(state[0])**2:.12f}")
    print(f"state_norm={np.vdot(state, state).real:.12f}")


if __name__ == "__main__":
    main()
