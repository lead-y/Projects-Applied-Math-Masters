function y = approxY(x,m)
%here x is a vector

Y = zeros(1,length(x));
coeffs = solve6(m);

for k = 1:length(x)
    Y(k) = coeffs(m+1);
    for i = m:-1:1
        Y(k) = Y(k)*x(k) + coeffs(i);
    end
end
y=Y;

end