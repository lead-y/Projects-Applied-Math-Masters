function [] = plotInterpolant(n,nodeType,f,plotColor)
%Plots the interpolant of a function using interpol_Newtons.m
%Inputs:
%n -- number of interpolation nodes = n+1
%nodeType -- Chebyshev or Equidistant (c or e)
%f -- function to be interpolated

if nodeType == 'e'
    x = -5:(10/n):5;
elseif nodeType == 'c'
    x = zeros(1,n+1);
    for i = 1:n+1
        x(i) = 5 * cos( (2*i-1)*pi / (2*n+2) );
    end
else
    error('Please input "e" or "c" for nodeType.')
end

t = -5:10^(-2):5;                   %input (domain) to the functions to be plotted

y = zeros(1, length(t));
for i = 1:length(y)
    y(i) = interpol_Newtons(f,x,t(i));
end

plot(t,y,plotColor,'LineWidth',1)
    
end

