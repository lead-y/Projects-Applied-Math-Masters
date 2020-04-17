function [tVec, yVec] = CrankNicSolver(N)
%Input:     N   -- N is the number of steps (N+1 points) & h = 100/N is the 
%                  step size;
%Output:    yVec   -- n+1 vector of yn values

%set up:
    %IVP:
y0 = [ 5e-7;
       2e-7;
       0;
       0];

    %Newton parameters:
atol = 1e-8;
rtol = 1e-8;
maxit = 1e3;
%

h=100/N;
t = 0:h:100; %t is scalar-valued
y = zeros(4,N+1); %y is a function into R^4
y(:,1) = y0;

for n=1:N
    %find initIter:
    initIter = y(:,n) + h*f(t(n),y(:,n));
    %Construct F:
    tn = t(n);
    yn=y(:,n);
    tn1 = t(n+1);
    F = @(y) newtFunc(h,tn,yn,tn1,y);
    %Construct the jacobian function
    df = @(y) DF(h,y);
    %call newton:
    y(:,n+1) = newton(F,df,initIter,atol,rtol,maxit);
end

tVec=t;
yVec=y;
end