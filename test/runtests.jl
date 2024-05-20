using CairoMakie
using SixelTerm
using Test

@testset "Display a PNG image" begin
    v = rand(10, 2)
    scene = scatter((@view v[:, 1]), (@view v[:, 2]); markersize=30.0)
    display(scene)
end
