function [ipJ] = ip_fpi(f_xi, pi_j, w)
%%Uses quadrature to generate the (f,pi_j) (on L^2[-1,1])
%input  -- input vectors (of scalars) f_xi, pi_j, w of equal length
%output -- ipJ = scalar value (f,pi_j)

%%%%%%%eval (f,pi_j) for all j=0,...,p (given f_xi, pi_j, w - all vectors)

%sum to get ipJ

ipJ = 0;
N = length(w);
for i=1:N
    ipJ = ipJ + ( w(i) * f_xi(i) * pi_j(i) );
end

end

