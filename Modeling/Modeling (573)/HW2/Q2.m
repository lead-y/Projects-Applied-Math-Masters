close
clear all

y0 = [3; 1; 0.1; 0.1];
Tf =85;
h = 10^(-2);

[t, y] = rk4_solver(@f, y0, Tf,h);

figure
plot(t,y(1,:),'LineWidth',2)
xlabel('t')
ylabel('s(t)')
title('Spring extension s(t) as a function of time t')

figure
plot(t,y(3,:),'LineWidth',2)
xlabel('t')
ylabel('\theta(t)')
title('Pendulum angle with the vertical, \theta(t), as a function of time t')

figure
hold on
plot(y(1,:),y(3,:),'HandleVisibility','off','LineWidth',2)
scatter(y(1,1),y(3,1),'or','MarkerFaceColor','r')
scatter(y(1,length(t)),y(3,length(t)),'og','MarkerFaceColor','g')
xlabel('s(t)')
ylabel('\theta(t)')
title('Spring extension s(t) vs pendulum angle with the vertical, \theta(t)')
legend('t = 0', ['t =',num2str(Tf)])

%part c: Plot the coordinates of m over time
x1 = zeros(1,length(t));
x2 = zeros(1,length(t));
for i = 1:length(t)
    s = y(1,i);
    theta = y(3,i);
    [x1(i), x2(i)] = coord_m(s,theta);
end

figure
hold on
plot(x1,x2,'LineWidth',2)
scatter(x1(1),x2(1),'or','MarkerFaceColor','r')
scatter(x1(length(t)),x2(length(t)),'og','MarkerFaceColor','g')
set(gca,'Ydir','reverse')
ylim([12 17])
title('Path taken by the mass m during the oscillations')
xlabel('x_1')
ylabel('x_2')
legend('path of m','t = 0', ['t = ' ,num2str(Tf)])

function [x1, x2] = coord_m(s,theta)
l=10;
x1 = l*sin(theta);
x2 = l*cos(theta) + s;
end

function xp = f(t,Y)
%y, xp are column vectors
m = 1;
k = 2;
l = 10;
g = 9.81;

x1 = Y(1);
x2 = Y(2);
x3 = Y(3);
x4 = Y(4);

x1p = x2;
x2p = (l+x1) * x4^2 + g*cos(x3) - k/m*x1;
x3p = x4;
x4p = (-2*x2*x4 - g*sin(x3)) / (l+x1);
xp = [x1p; x2p; x3p; x4p];
end

function [t, y] = rk4_solver(f, y0, Tf, h)
% classical 4th order Runge-Kutta method
%y0 is a column vector

t = [0 : h : Tf];
N = length(t);

y(:,1) = y0;

% time-stepping loop
for n = 1 : N-1
    k1 = f(t(n), y(:,n));
    k2 = f(t(n) + 0.5*h, y(:,n) + 0.5*h*k1);
    k3 = f(t(n) + 0.5*h, y(:,n) + 0.5*h*k2);
    k4 = f(t(n) + h, y(:,n) + h*k3);

    y(:,n+1) = y(:,n) + h * (1/6)*(k1 + 2*k2 + 2*k3 + k4);    % advance in time
end

end