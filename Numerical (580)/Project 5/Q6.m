close
clear all

list1 = [10 20 40 80 160];
list2 = list1+1;

%for A:
dataA = zeros(4,5);
for i = 1:length(list1)
    n = list1(i);
    dataA(1,i) = n;
    [a, l_true] = A(n);
    x0 = zeros(n,1);
    [l_calc, x, k] = leastEig(a,ones(n,1));
    dataA(2,i) = k;
    dataA(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataA(4,i) = norm( a*x - l_calc*x );
end

%for B:
dataB = zeros(4,5);
for i = 1:length(list2)
    n = list2(i);
    dataB(1,i) = n;
    [b, l_true] = B(n);
    x0 = zeros(n,1);
    for I=1:2:n
        x0(I) = 1;
    end
    [l_calc, x, k] = leastEig(b,x0);
    dataB(2,i) = k;
    dataB(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataB(4,i) = norm( b*x - l_calc*x );
end

%for C:
dataC = zeros(4,5);
for i = 1:length(list1)
    n = list1(i);
    dataC(1,i) = n;
    [c, l_true] = C(n);
    x0 = zeros(n,1);
    [l_calc, x, k] = leastEig(c,ones(n,1));
    dataC(2,i) = k;
    dataC(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataC(4,i) = norm( c*x - l_calc*x );
end


function [a, least_eval] = A(n)
a = 2*eye(n) + diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1);
least_eval = 2 - 2*cos(pi/(n+1));
end

function [b, least_eval] = B(n)
b = 2*eye(n) + diag(-1*ones(n-1,1),1) + diag(ones(n-1,1),-1);
least_eval = minMag(eig(b));
end

function [c, least_eval] = C(n)
%the eigenvalues of C are the n random numbers on the diagonal of d
d = diag(rand(n,1) * 100);
least_eval = minMag(diag(d));
s = rand(n,n);
c = inv(s) * d * s;
end

function least = minMag(v)
[~,i] = min(abs(v));
least = v(i);
end
