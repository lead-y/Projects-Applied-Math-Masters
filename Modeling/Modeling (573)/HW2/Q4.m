close
clear all

phi_a = @(z) (1 + z/2) / (1-z/2);
pt_a = 'Stability region of Crank-Nicolson';
plotSR(phi_a,pt_a)
phi_b = @(z) 1 + z + 1/2*z^2;
pt_b = 'Stability region of RK2';
plotSR(phi_b,pt_b)

function plotSR(phi,plotTitle)
%z is a function handle, which is the stability function
%plotTitle is a string

axisScale = 5;
%Re(z) / x-range and number of points
xmin = -axisScale;
xmax = axisScale;
Nx = 10^3;

%Im(z) / y-range and number of points
ymin = -axisScale;
ymax = axisScale;
Ny = 10^3;

%x and y axes, mesh, etc
x = linspace(xmin,xmax,Nx);
y = linspace(ymin,ymax,Ny);
[X,Y] = meshgrid(x,y);
Z = X + i*Y;

%stability function at each point in Z
PHI = zeros(size(Z));
[nZrows, nZcols] = size(Z);
for I = 1:nZrows
    for J = 1:nZcols
        PHI(I,J) = phi(Z(I,J));
    end
end

magnitudePHI = abs(PHI);

%contour map
figure
hold on
contour(X,Y,magnitudePHI,[1, 1],'LineWidth',2)
axis([xmin, xmax, ymin, ymax])
plot(x,zeros(1,length(x)),':k',zeros(1,length(y)),y,':k','LineWidth',1)
xlabel('Re(z)')
ylabel('Im(z)')
title(plotTitle)
end