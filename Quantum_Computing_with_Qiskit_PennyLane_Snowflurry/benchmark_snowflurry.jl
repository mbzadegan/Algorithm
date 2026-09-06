#!/usr/bin/env julia
# Statevector benchmark for Snowflurry.jl.

using Printf
using Snowflurry
using Statistics

function parameters()
    n = length(ARGS) >= 1 ? parse(Int, ARGS[1]) : 14
    depth = length(ARGS) >= 2 ? parse(Int, ARGS[2]) : 8
    repeats = length(ARGS) >= 3 ? parse(Int, ARGS[3]) : 10
    n >= 2 && depth >= 1 && repeats >= 1 ||
        error("Use qubits >= 2, depth >= 1, repeats >= 1")
    return n, depth, repeats
end

function build_circuit(n, depth)
    circuit = QuantumCircuit(qubit_count=n)
    for layer in 1:depth
        for q in 1:n
            theta = 0.017 * (3 * layer + q)
            push!(circuit, rotation_x(q, theta))
            push!(circuit, rotation_y(q, theta / 2.0))
            push!(circuit, rotation_z(q, -theta / 3.0))
        end
        for q in 1:(n - 1)
            push!(circuit, control_x(q, q + 1))
        end
        push!(circuit, control_x(n, 1))
    end
    return circuit
end

function main()
    n, depth, repeats = parameters()

    t0 = time_ns()
    circuit = build_circuit(n, depth)
    build_s = (time_ns() - t0) / 1.0e9

    t0 = time_ns()
    state = simulate(circuit)
    cold_s = (time_ns() - t0) / 1.0e9

    # One untimed execution ensures JIT compilation is complete.
    simulate(circuit)

    samples = Float64[]
    for _ in 1:repeats
        GC.gc()
        t0 = time_ns()
        state = simulate(circuit)
        push!(samples, (time_ns() - t0) / 1.0e9)
    end

    package_version = Base.pkgversion(Snowflurry)
    gate_count = depth * 4 * n
    println("framework=Snowflurry version=$(package_version)")
    println("qubits=$(n) depth=$(depth) gates=$(gate_count) repeats=$(repeats)")
    @printf("build_s=%.9f\n", build_s)
    @printf("cold_run_s=%.9f\n", cold_s)
    @printf("warm_median_s=%.9f\n", median(samples))
    @printf("warm_mean_s=%.9f\n", mean(samples))
    @printf("warm_min_s=%.9f\n", minimum(samples))
    @printf("p_all_zero=%.12f\n", abs2(state.data[1]))
    @printf("state_norm=%.12f\n", sum(abs2, state.data))
end

main()
