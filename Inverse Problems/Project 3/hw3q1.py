from fenics import *
import numpy as np

#Create mesh and define function space
mesh = RectangleMesh(Point(-1.0,-1.0), Point(1.0,1.0), 32, 32 )
V = FunctionSpace(mesh,'P',2)

#Define boundary condition
u0 = Constant(0.0)

def boundary(x,on_boundary):
    return on_boundary

bc = DirichletBC(V,u0,boundary)

#Define variational problem
u = TrialFunction(V)
v = TestFunction(V)

f = Expression("exp(-100 * (x[0]*x[0] + x[1]*x[1]) )", degree=2)
A = Constant( ((1,-5),(-5,100)) )
a = dot(A*grad(u), grad(v))*dx
L = f*v*dx

#Compute solution
u = Function(V)
solve(a == L, u, bc)

# Plot solution and mesh
plot(u)
plot(mesh)

# Save solution in VTK format
file = File("hw3q1b.pvd")
file << u
