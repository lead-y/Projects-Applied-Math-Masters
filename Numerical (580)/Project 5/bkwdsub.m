function x = bkwdsub(U,b)
n = length(b);
x = zeros(size(b));
for i = n:-1:1
    x(i) = b(i);
    for j=i+1:n
        x(i) = x(i) - U(i,j)*x(j);
    end
    x(i) = x(i)/U(i,i);
end
end