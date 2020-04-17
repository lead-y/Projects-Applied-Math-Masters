function [phi,coeffs] = leastSq(f,p,y)
%input -- function (handle) to be approximated, f; approximation order, p;
%y, where phi is a function of y
%output -- least squares approximation, phi(y) (scalar for a given y)

%%%%%use gauss_quad to `generate N w_i's x_i's; compute f(x_i)'s
N = 10^2; %Quadrature is N-point

[x, w] = gauss_quad(N);
f_xi = zeros(1,N);
for i=1:N
    f_xi(i) = feval(f,x(i));
end

%%%%%generate pi_j(x_i) for x_i values in vector x(j=0,...,p) (i=1,...,N)
%%%%% using legpoly.m -- output is a matrix

pi = legpoly(x,p); %pi(i,j)=pi_j(x_i) i=1,...,N; j=0,...,p


%%%%%eval (f,pi_j) for all j=0,...,p (given f_xi, pi_j, w - all vectors)
ip_f_pi = zeros(1,p+1);

for j=0:p
    ip_f_pi(j+1) = ip_fpi(f_xi,pi(:,j+1),w);
end

%%%%%eval (pi_j,pi_j) for all j=0,...,p 
ip_pi_pi = zeros(1,p+1);
for j = 0:p
    ip_pi_pi(j+1) = 2/(2*j+1);
end

%%%%%record the expansion coeffients (f,pi_j) / (pi_j,pi_j) j=0,...,p
coeffs = zeros(1,p+1);
for j=0:p
    coeffs(j+1) = ip_f_pi(j+1) / ip_pi_pi(j+1);
end

%%%%%compute the function value, phi, at y.
pi_jAty = legpoly(y,p);

phi = 0;
for j=0:p
    phi = phi + coeffs(j+1) * pi_jAty(1,j+1);
end

end

