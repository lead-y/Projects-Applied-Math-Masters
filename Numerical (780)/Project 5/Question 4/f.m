function y = f(delta,gamma,r,h)
%Compute f using the composite trapezoid rule.
%Input -- delta; gamma; r; h -- step size of the quadrature grid.
%Output -- scalar value of f at delta, gamma, r

T = 10;

%IVP:
tspan = [0, 10];
N = 1000;

dSIR = @(t,SIR) [ delta * (N-SIR(1)) - gamma * SIR(2) * SIR(1)
                  gamma * SIR(2) * SIR(1) - (r+delta) * SIR(2)
                  r * SIR(2) - delta * SIR(3)];
SIR_0 = [900,100,0];
%

sol = ode45(dSIR,tspan,SIR_0); 

%%Use composite trap rule to get the integral:

%create the grid:
grid = 0:h:T;

%Evaluate y, the solution to the IVP, on the grid.
F = zeros(size(grid));
for i = 1:length(grid)
    SIRatT = deval(sol,grid(i));
    F(i) = SIRatT(3);
end

%use the rule

In = (1/2) * F(1);
for i = 2:(length(grid)-1)
    In = In + F(i);
end
In = In + (1/2) * F(end);
I = In * h; %I is the integral

y = 1/T * I;

end