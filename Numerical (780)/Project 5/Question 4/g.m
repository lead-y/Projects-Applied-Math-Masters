function a = g(x)
%Input: x -- should be in [-1,1]^3, vector of length 3; 
%Output -- scalar value of f at alpha(x1), alpha(x2), alpha(x3)

x1 = x(1);
x2 = x(2);
x3 = x(3);

h=0.2;   %       h -- quad step size (scalar)
alpha = @(x) 0.99/2*x + 1.01/2;
delta = alpha(x1);
gamma = alpha(x2);
r     = alpha(x3);
a = f(delta,gamma,r,h);

end
