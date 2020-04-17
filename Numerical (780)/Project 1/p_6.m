function [y] = p_6()
%p_6 for e^x where a=1

y = @(x) 0;

for i = 0:6
    sum = @(x) exp(1) * (x-1)^i / factorial(i);
    y = @(x) y(x) + sum(x);
end

end

