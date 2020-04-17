function [ygrid, Eh] = heunSolver(i,dy,y0,func_Y)
%input: i (where 2^i is the number of steps; h=5/(2^i) is
%the step size)
%dy: function handle of y'
%y0: the value of y(0)
%func_Y: function handle of Y, the true solution to the IVP
%output: y -- (1 by 2^i + 1) vector of yn values; Eh -- max_n |Y(x_n)-y_n|

nSteps = 2^i; %this is one less than the number of values in the grid function
h = 5/(2^i);
x = 0:h:5;
y = zeros(1,nSteps + 1);
y(1) = y0;

for n = 1:nSteps
    k = feval(dy,x(n),y(n));
    y(n+1) = y(n) + h/2 * ( k + feval(dy,x(n+1),y(n)+h*k) );
end

ygrid=y;

%%Find the error E_h = max_n |Y(x_n)-y_n|:

%generate a grid of Y evaluated at each point x_n
Y = zeros(size(x));
for i = 1:length(Y)
    Y(i) = feval(func_Y,x(i));
end
errorGrid = zeros(size(x));
for i = 1:length(errorGrid)
    errorGrid(i) = abs(Y(i) - ygrid(i));
end

Eh = max(errorGrid);

end

