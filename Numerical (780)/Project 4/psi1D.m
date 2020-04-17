function psi = psi1D(x, nord)
% function: psi1D
% purpose:  Generates 1-D Legendre polynomials
%
% usage: psi = psi1D(x, nord)
%           
% input:
%    x   : column vector of points
%    nord: expansion order
%
% output:
%    psi:  polynomial evaluated at points x [length(x) * nord]

nclp = length(x);
psi = zeros(nclp, nord + 1);

psi(:, 1) = 1;

if (nord > 0)
    psi(:, 2) = x;

    % computing 1D legendre polynomials
    for i = 3 : nord + 1
        psi(:,i)= (2*i-3)/(i-1) * x(:) .* psi(:, i-1) - (i-2)/(i-1) * psi(:, i-2);
    end
end
