using Test
using MyPkg

# Inputs
m0   = [1.0, 0.0, 0.0]
Δt   = 0.001
tmax = 3.0

expected_result    = solver(m0, Δt, tmax, Theoretical())
numerical_solution = solver(m0, Δt, tmax, ForwardEuler())

@test numerical_solution ≈ expected_result
