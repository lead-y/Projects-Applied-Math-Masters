close
clear all

beta = 5;
gamma = 1;
delta = 0.2;

odefun = @(t,y) [-beta*y(1)*y(2)/sum(y) + delta*y(3);
                  beta*y(1)*y(2)/sum(y) - gamma*y(2);
                  gamma*y(2) - gamma*y(3)];
tspan = [0,10];
y0 = [999,1,0];
[T,Y] = ode15s(odefun,tspan,y0);

figure
hold on
plot(T,Y(:,1),'LineWidth',1.5)
plot(T,Y(:,2),'LineWidth',1.5)
title('SIR Model over time')
xlabel('time')
ylabel('population')
legend('S','I')

figure
plot(Y(:,1),Y(:,2),'LineWidth',1.5)
title('SIR Model: S vs I')
xlabel('susceptible population (S)')
ylabel('infected population (I)')

