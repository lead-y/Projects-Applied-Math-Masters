function x = fwdsub(L,b)
n = length(b);
x = zeros(size(b));
for i = 1:n
    x(i) = b(i);
    for j = 1:i-1
        x(i) = x(i) - L(i,j)*x(j);
    end
    x(i) = x(i)/L(i,i);
end
end