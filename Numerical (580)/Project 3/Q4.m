close
clear all

k=6;
detvec = zeros(k,1);
for n=1:k
    A = genA(n);
    detvec(n) = det(A);
end

funcvec = zeros(k,1);
for n=1:k
    funcvec(n) = 2^(n - 1);
end

%%%
k = 6inv;
A = genA(k);
L = genL(k);
U = genU(k);
%LU = L*U;
%res = A-LU;
invU = inv(U);
    
function L = genL(n)
l = zeros(n);
    for j = 1:n
        l(j,j) = 1;
        for i = (j+1):n
            l(i,j) = -1;
        end
    end
L=l;
end

function U = genU(n)
u = eye(n);
for i = 1:n
    u(i,n) = 2^(i-1);
end
U=u;
end

function A = genA(n)
a = zeros(n);
a(:,n) = 1;
for j = 1:(n-1)
    a(j,j) = 1;
    for i = (j+1):n
        a(i,j) = -1;
    end
end
A = a;
end