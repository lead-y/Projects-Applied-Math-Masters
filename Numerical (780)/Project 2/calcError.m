function [err] = calcError(f,p)
%Calculates the L2 error (err - a 1xp array) of the least squares approximation of a
%function f of order 1,...,p using quadrature (gauss_quad.m).

%generate nodes and weights
N=10^2;
[x, w] = gauss_quad(N);

%evaluate the function at each node
f_xi = zeros(1,N);
for i=1:N
    f_xi(i) = feval(f,x(i));
end

%evaluate the approximation for each p at each node
approx = zeros(p,N);
for i=1:p
    for j=1:N
        approx(i,j) = leastSq(f,i,x(j));
    end
end

%subtract, square, mult by weights and sum everything.
err = zeros(1,p);
for i=1:p
    for j=1:N
        err(i) = err(i) + w(j) * (feval(f,x(j)) - approx(i,j))^2;
    end
end

end

