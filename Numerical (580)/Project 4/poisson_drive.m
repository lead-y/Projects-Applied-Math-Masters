clear all

% This Matlab code tests poisson_sor.m using the folowing
% exact solution:
%
%   u(x,y) = exp(x)*sin(pi*y), 
%
% Therefore, f(x,y) = (1-pi^2) exp(x)*sin(pi*y).

n=20; h=1/n; x = 0:h:1;  y=x; u0=zeros(n+1,n+1); f=u0; ue=u0;

% Set Dirichlet boundary condition

for i=1:n+1,
  u0(1,i) = exp(x(1))*sin(pi*y(i));
  u0(n+1,i) = exp(x(n+1))*sin(pi*y(i));
  u0(i,1) = exp(x(i))*sin(pi*y(1));
  u0(i,n+1) = exp(x(i))*sin(pi*y(n+1));
end

% Set right hand side

for i=1:n+1,
  for j=1:n+1
    f(i,j) = (1-pi^2)*exp(x(i))*sin(pi*y(j));
    ue(i,j) = exp(x(i))*sin(pi*y(j));
  end
end

w = 1.7; tol = 1.0e-8;

[k, u] = poisson_sor(n,h,w,f,u0,tol);

figure(1); mesh(x,y,u);xlabel('x');ylabel('y');
zlabel('u'); title('Solution Plot');
figure(2); mesh(x,y,u-ue); xlabel('x');ylabel('y');
zlabel('e(x,y)'); title('Error Plot');
k, max(max(abs(u-ue)))