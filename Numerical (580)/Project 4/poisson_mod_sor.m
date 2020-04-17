% This Matlab code solves Poisson equation 
%
%    u_xx + u_yy + a*u_x - b*u_y = f(x,y)
% on a square,   0<= x, y <= 1.
% with Dirichlet BC which is given for u(1,i), u(n+1,1), u(j,1), u(j,n+1).

function [k,u] = poisson_mod_sor(n,h,w,f,u0,tol,a,b)

% Input: n, h, w, f, u0, tol
% Output: k: the number of iterations.
%         u: The computed solution.

error = 1000; u = u0;

k = 0;
while error > tol
  for i=2:n
     for j=2:n
     u_temp = (u(i-1,j) + u(i+1,j) + u(i,j-1) + u(i,j+1) )/(h^2) + ( a*u(i+1,j) + b*u(i,j-1) )/h;
     multiplier = -w*h / (4/h + a + b);
	 u(i,j) = (1-w)*u0(i,j)  + multiplier*(f(i,j)-u_temp);
     end
  end

  error = max(max(abs(u-u0)));
  u0 = u;
  k = k+1;
end