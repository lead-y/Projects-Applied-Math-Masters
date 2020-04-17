function [interpVal] = interpol_Newtons(f, x, t)
%Generates the value of of the interpolation polynomial of deg n (where n=
%length(x)-1) using Newton's method for generating interpolating
%polynomial.
%inputs: f --- arbitrary function (handle?);
%        x --- 1 by n+1 array of interpolation points
%        t --- value at which interpolating poly is evaluated.
%output: interpVal --- interpolating polynomial evaluated at t

n = length(x) - 1;

% Generate the f values
fval = zeros(1,n+1);
for i = 1:(n+1)
    fval(i) = feval(f,x(i));
end

% Generate the Newton coefficients

newtArray = fval;
for j = 2:n+1
    for i = (n+1):-1:j
        newtArray(i) = ( newtArray(i) - newtArray(i-1) ) / ( x(i) - x(i-j+1));
    end
end

% Evaluate the interpolant

newtSum = newtArray(n+1);
for i = n:-1:1
    newtSum = newtSum * (t - x(i)) + newtArray(i);
end

interpVal = newtSum;

