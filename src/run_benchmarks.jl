using BenchmarkTools
using JSON
using LinearAlgebra

# Example benchmark function
function benchmark_task()
    # Example code to benchmark
    A = rand(1000, 1000)
    B = rand(1000, 1000)
    C = similar(A)
    @benchmark mul!($C, $A, $B)
end

# Run benchmarks and save results
function run_benchmarks()
    println("Running benchmarks...")

    # Run the benchmark
    result = benchmark_task()

    # Save the results to a JSON file
    output_path = joinpath(@__DIR__, "../benchmarks/benchmark_results.json")
    println("Saving benchmark results to: $output_path")

    open(output_path, "w") do io
        write(io, JSON.json(result))
    end

    println("Benchmarks completed.")
end

run_benchmarks()
