module PELMain

# Include necessary files
include("run_benchmarks.jl")

# Entry point for the project
function main()
    println("Starting benchmarks...")
    run_benchmarks()
    println("Benchmarks completed.")
end

# Run the main function if the script is executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

end
