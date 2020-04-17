function [y] = p_13()
%p_13 for 1/(1-x) where a=0

y = @(x) 0;

for i = 0:13
    sum = @(x) x^i;
    y = @(x) y(x) + sum(x);
end

end
