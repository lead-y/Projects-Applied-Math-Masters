function [eigenvalue, eigenvector, k] = domEigInfty(A,x0)
%uses the power method with infinity norm scaling to find the dominant
%eigenvalue and corresponding eigenvector of A.
tol = 10^(-6);

x_old = x0;
err = 9999;
mu_old = 9999;
k=0;
while err >= tol
    y = A*x_old;
    x = y/norm(y,inf);
    mu = maxMag(y) / maxMag(x_old);
    err = abs(mu - mu_old);
    mu_old = mu;
    x_old=x;
    k = k+1;
end
eigenvalue = mu;
eigenvector = x;

function xp = maxMag(v)
    [~,i] = max(abs(v));
    xp = v(i);
end

end