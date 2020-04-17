function [] = plotError(p_n,f,intStart,intEnd,tol)
%input error function, interval
%   Detailed explanation goes here

x = [intStart:10^(-3):intEnd];
p_nArray = zeros(1,length(x));
fArray = zeros(1,length(x));
err = zeros(1,length(x));

for i = 1:length(x)
    p_nArray(i) = feval(p_n, x(i));
    fArray(i) = feval(f,x(i));
end

err = abs(p_nArray - fArray);

t = zeros(1,length(x))+tol;

plot(x,t,x,err)
ylim([0 1.25*tol])

end

