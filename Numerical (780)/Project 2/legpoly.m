function psi = legpoly(x, n)
% purpose: computes legendre polynomials of order up to n 
%
% Input: 
%   x --- vector of x values where we want to evaluate the polynomials
%   n --- order  
%
% Output:
%
%   psi --- a matrix with psi(i, j) = pi_j(x(i)), where here pi_j is the
%           legendre polynomial of order j-1. 

psi = zeros(length(x), n + 1);

psi(:, 1) = 1;

if (n > 0)
   psi(:, 2) = x;

   % computing 1D legendre polynomials
   for i = 3 : n+1
      psi(:,i)= (2*i-3)/(i-1) * x(:) .* psi(:, i-1) - (i-2)/(i-1) * psi(:, i-2);
   end
end