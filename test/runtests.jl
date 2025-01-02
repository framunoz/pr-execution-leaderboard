using Test
using MyPkg

expected_result    = 34 - 1 #solve(..., Theoretical())
numerical_solution = expensive_computation(10) #solve(..., ForwardEuler())

@test numerical_solution ≈ expected_result