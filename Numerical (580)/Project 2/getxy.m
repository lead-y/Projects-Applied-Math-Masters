function [x,y] = getxy(m)
%Given m, gets 1xm+1 vectors x and y

h= 1/m;

x = zeros(1,m+1);
for i = 1:(m+1)
    x(i) = (i-1)*h;
end

y = zeros(1,m+1);
for i = 1:(m+1)
    y(i) = sin(pi * x(i));
end

end