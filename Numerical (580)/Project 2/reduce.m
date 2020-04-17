function Q = reduce(A)
%performs GE with partial pivoting to get an augmented upper triangular
%matrix.

m = numRows(A)-1;

for i=1:m
    A = rowswap(A,i);
    A = pivot(A,i);
end
Q = A;    

end