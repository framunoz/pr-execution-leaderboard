module PELMain

# Include necessary files
include("run_benchmarks.jl")

# Entry point for the project
function main()
    run_benchmarks()
end

# Run the main function if the script is executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

end
