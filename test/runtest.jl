using Test
push!(LOAD_PATH, "src")
using MyModule

function expensive_computation_recursive(n::Int)
    if n == 1
        return 0
    elseif n == 2
        return 1
    else
        return expensive_computation_recursive(n - 1) + expensive_computation_recursive(n - 2)
    end
end
n=30
expected_result    = expensive_computation_recursive(n)#solve(..., Theoretical())
numerical_solution = expensive_computation(n)#solve(..., ForwardEuler())

@test numerical_solution ≈ expected_result