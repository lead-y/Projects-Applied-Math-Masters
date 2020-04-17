close
clear all

h = 0.5*10^(-1);
t = 0:h:5;
x = -1:h:10;
m = length(t);
n = length(x);

[T,X] = meshgrid(t, x);

Z = zeros(size(T));
for j = 21:41
    for i = 1:m
        ti = t(i);
        xj = x(j);
        Z(j,i) = sin(pi*xj*exp(-ti))^2 * exp(-ti^2 / 2);
    end
end

figure
surf(T,X,Z)
title('Solution to IVP')
xlabel('t')
ylabel('x')
zlabel('u(t,x)')

