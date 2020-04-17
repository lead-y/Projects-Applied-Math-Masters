close
clear all

% Plots the error and the tolerance for a given p_n, f, tol, and interval:

%for the function e^x; a=1; tol 10^(-3); int = [0,1]

p_n = p_6();
f = @(x) exp(x);
tol = 10^(-3);

figure
plotError(p_n,f,0,1,tol)
title('Error of Taylor Approximation of e^x')
legend('tolerance: y = 10^{-3}','error: |p_6(x) - f(x)|')
xlabel('x')
ylabel('y')

p_n_ = p_13();
f_ = @(x) 1/(1-x);
tol_ = 10^(-4);

figure
plotError(p_n_, f_, -1/2, 0 , tol_)
title('Error of Taylor Approximation of 1/(1-x)')
legend('tolerance: y = 10^{-4}','error: |p_{13}(x)-f(x)|')
xlabel('x')
ylabel('y')

