function A = getA(x,y)
%get  augmented matrix A given x,y

m = length(x) - 1;
A = zeros(m+1,m+2);

%fill in body of matrix (not the augmented "b" part)
for i = 1:(m+1)
    for j = 1:(m+1)
        A(i,j) = x(i)^(j-1);
    end
end

%fill in augmented "b" part of matrix
A(:,m+2) = y;

end