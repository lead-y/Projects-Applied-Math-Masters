function coeffs = backsub(Q)
%gets the coefficients of the matrix U (Q = U|y).

m = numRows(Q)-1;
a = zeros(1,m+1);

for i = (m+1):-1:1 
    a(i) = Q(i,m+2); 
    for j = (i+1):(m+1)
        a(i) = a(i) - Q(i,j)*a(j);
    end
    a(i) = a(i) / Q(i,i);
end

coeffs = a;

end