function [eigenvalue, eigenvector, k] = domEig(A,x0)
%Find the dominant eigenvalue and corresponding eigenvector using 
%the Power method with variable scaling, as dictated by norm. 
%norm = 1, 2, or inf

tol = 10^(-6);

x_old = x0;
mu_old = 9999;
err = 9999;
k=0;
while err >= tol
    y = A*x_old;
    x = y/norm(y);
    mu = transpose(x)*A*x;
    err = abs(mu - mu_old);
    mu_old = mu;
    x_old=x;
    k = k+1;
end
eigenvalue = mu;
eigenvector = x;
end