function [eigenvalue, eigenvector, k] = leastEig(A,x0)
%given a matrix A, and inital guess x0, apply the inverse power method to 
%find least dominant eigenvalue and corresponding eigenvector. Also returns
%k, the number of iterations taken.

[L, U, P]= lu(A);
tol = 10^(-6);

x_old = x0; %starting x value
err = 1000;
k = 0;
while err >= tol
    %z = L\(P*x_old);
    z = fwdsub(L,P*x_old);
    %y = U\z;
    y = bkwdsub(U,z);
    x = y / norm(y,2);
    mu = transpose(x)*A*x;
    err = norm(x - x_old) / norm(x_old);
    x_old=x;
    k = k+1;
end
eigenvalue = mu;
eigenvector = x;
end