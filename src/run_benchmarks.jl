using BenchmarkTools
using JSON
using LinearAlgebra

# Example benchmark function
function benchmark_task()
    # Example code to benchmark
    A = rand(1000, 1000)
    B = rand(1000, 1000)
    C = similar(A)
    return @benchmark mul!($C, $A, $B)
end

# Run benchmarks and save results in the desired format
function run_benchmarks()
    println("Running benchmarks...")

    # Run the benchmark
    result = benchmark_task()

    # Extract benchmark data
    times = result.times  # List of times for each evaluation
    memory = result.memory  # List of memory usage

    # Create a dictionary with the desired structure
    benchmark_data = Dict(
        "task" => "Matrix multiplication",
        "parameters" => Dict("size" => (1000, 1000)),
        "results" => [
            Dict("time" => times, "memory" => memory)
        ]
    )

    # Save the results to a JSON file
    output_path = joinpath(@__DIR__, "../benchmarks/benchmark_results.json")
    println("Saving benchmark results to: $output_path")

    open(output_path, "w") do io
        write(io, JSON.json(benchmark_data))
    end

    println("Benchmarks completed.")
end

run_benchmarks()
