function coeffs = solve6(m)
%given m, finds coeffs using GE partial pivoting with bkwd substitution

[x,y] = getxy(m);
A = getA(x,y);
Q = reduce(A);
coeffs = backsub(Q);
end