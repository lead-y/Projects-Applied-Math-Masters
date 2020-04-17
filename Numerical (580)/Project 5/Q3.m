close
clear all

nlist = [10,20,40,80,160];
nlist2 = nlist+1;
%scaleList = [1,2,inf];

% % % %A with norm 1
% % % dataA_1 = zeros(4,length(nlist));
% % % for i = 1:length(nlist)
% % %     n = nlist(i);
% % %     dataA_1(1,i) = n;
% % %     [a, l_true] = A(n);
% % % %     x0 = zeros(n,1);
% % % %     for I = 1:length(x0)/2
% % % %         x0(I) = 1;
% % % %     end
% % %     [l_calc, x, k] = domEig(1,a,ones(n,1));
% % %     dataA_1(2,i) = k;
% % %     dataA_1(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
% % %     dataA_1(4,i) = norm( a*x - l_calc*x );
% % % end

%A with norm 2
dataA_2 = zeros(4,length(nlist));
for i = 1:length(nlist)
    n = nlist(i);
    dataA_2(1,i) = n;
    [a, l_true] = A(n);
    [l_calc, x, k] = domEig(a,ones(n,1));
    dataA_2(2,i) = k;
    dataA_2(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataA_2(4,i) = norm( a*x - l_calc*x );
end

%A with norm inf
dataA_inf = zeros(4,length(nlist));
for i = 1:length(nlist)
    n = nlist(i);
    dataA_inf(1,i) = n;
    [a, l_true] = A(n);
    [l_calc, x, k] = domEigInfty(a,ones(n,1));
    dataA_inf(2,i) = k;
    dataA_inf(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataA_inf(4,i) = norm( a*x - l_calc*x );
end

% % % %B with norm 1
% % % dataB_1 = zeros(4,length(nlist2));
% % % for i = 1:length(nlist2)
% % %     n = nlist2(i);
% % %     dataB_1(1,i) = n;
% % %     [b, l_true] = B(n);
% % % %     x0 = zeros(n,1);
% % % %     for I = 1:length(x0)/2
% % % %         x0(I) = 1;
% % % %     end
% % %     [l_calc, x, k] = domEig(1,b,ones(n,1));
% % %     dataB_1(2,i) = k;
% % %     dataB_1(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
% % %     dataB_1(4,i) = norm( b*x - l_calc*x );
% % % end
% % % 
% % % %B with norm 2
% % % dataB_2 = zeros(4,length(nlist2));
% % % for i = 1:length(nlist2)
% % %     n = nlist2(i);
% % %     dataB_2(1,i) = n;
% % %     [b, l_true] = B(n);
% % %     [l_calc, x, k] = domEig(2,b,ones(n,1));
% % %     dataB_2(2,i) = k;
% % %     dataB_2(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
% % %     dataB_2(4,i) = norm( b*x - l_calc*x );
% % % end
% % % 
% % % %B with norm inf
% % % dataB_inf = zeros(4,length(nlist2));
% % % for i = 1:length(nlist2)
% % %     n = nlist2(i);
% % %     dataB_inf(1,i) = n;
% % %     [b, l_true] = B(n);
% % %     [l_calc, x, k] = domEig(inf,b,ones(n,1));
% % %     dataB_inf(2,i) = k;
% % %     dataB_inf(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
% % %     dataB_inf(4,i) = norm( b*x - l_calc*x );
% % % end

% % % %C with norm 1
% % % dataC_1 = zeros(4,length(nlist));
% % % for i = 1:length(nlist)
% % %     n = nlist(i);
% % %     dataC_1(1,i) = n;
% % %     [c, l_true] = C(n);
% % %     [l_calc, x, k] = domEig(1,c,ones(n,1));
% % %     dataC_1(2,i) = k;
% % %     dataC_1(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
% % %     dataC_1(4,i) = norm( c*x - l_calc*x );
% % % end

%C with norm 2
dataC_2 = zeros(4,length(nlist));
for i = 1:length(nlist)
    n = nlist(i);
    dataC_2(1,i) = n;
    [c, l_true] = C(n);
    [l_calc, x, k] = domEig(c,ones(n,1));
    dataC_2(2,i) = k;
    dataC_2(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataC_2(4,i) = norm( c*x - l_calc*x );
end

%C with norm inf
dataC_inf = zeros(4,length(nlist));
for i = 1:length(nlist)
    n = nlist(i);
    dataC_inf(1,i) = n;
    [c, l_true] = C(n);
    [l_calc, x, k] = domEigInfty(c,ones(n,1));
    dataC_inf(2,i) = k;
    dataC_inf(3,i) = norm(l_calc - l_true) / norm(l_true); %relative error
    dataC_inf(4,i) = norm( c*x - l_calc*x );
end


function [a, dom_eval] = A(n)
a = 2*eye(n) + diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1);
dom_eval = 2 - 2*cos(n*pi/(n+1));
end

function [b, dom_eval] = B(n)
b = 2*eye(n) + diag(-1*ones(n-1,1),1) + diag(ones(n-1,1),-1);
dom_eval = maxMag(eig(b));
end

function [c, dom_eval] = C(n)
%the eigenvalues of C are the n random numbers on the diagonal of d
d = diag(rand(n,1) * 100);
dom_eval = maxMag(diag(d));
s = rand(n,n);
c = inv(s) * d * s;
end

function dominant = maxMag(v)
[~,i] = max(abs(v));
dominant = v(i);
end