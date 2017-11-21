include("daggen.jl")

addprocs(5)

using DagScheduler
using Base.Test

const dag1 = gen_straight_dag(ones(Int, 6^4))
result = rundag(dag1, nexecutors=nworkers(), slowdown=false, debug=false)
info("result = ", result)
@test result == 1

const dag2 = gen_sort_dag()
result = rundag(dag2, nexecutors=nworkers(), slowdown=false, debug=false)
info("result = ", result)
@test issorted(result)

#=
const dag3 = gen_cross_dag()
result = rundag(dag3, nexecutors=nworkers(), slowdown=false, debug=false)
info("result = ", result)
@test result == 84
=#
