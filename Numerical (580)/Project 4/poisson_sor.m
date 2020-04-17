% This Matlab code solves Poisson equation 
%
%    u_xx + u_yy = f(x,y)
% on a square,   0<= x, y <= 1.
% with Dirichlet BC which is given for u(1,i), u(n+1,1), u(j,1), u(j,n+1).

function [k,u] = poisson_sor(n,h,w,f,u0,tol)

% Input: n, h, w, f, u0, tol
% Output: k: the number of iterations.
%         u: The computed solution.

error = 1000; u = u0;

k = 0;
while error > tol
  for i=2:n
     for j=2:n
	u_temp = (u(i-1,j) + u(i+1,j) + u(i,j-1) + u(i,j+1) )/4;
	u(i,j) = (1-w)*u0(i,j)  + w*(u_temp - h^2*f(i,j)/4);
     end
  end

  error = max(max(abs(u-u0)));
  u0 = u;
  k = k+1;
end