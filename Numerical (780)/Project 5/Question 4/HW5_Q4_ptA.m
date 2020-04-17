%IVP:
N = 1000;

dSIR = @(t,SIR) [ delta * (N-SIR(1)) - gamma * SIR(2) * SIR(1)
                  gamma * SIR(2) * SIR(1) - (r+delta) * SIR(2)
                  r * SIR(2) - delta * SIR(3)];
SIR_0 = [900,100,0];
%

delta = 0.5;
gamma = 0.15;
r = 0.5;
tspan = [0, 10];

sol = ode45(dSIR,tspan,SIR_0);

time_mesh = 0:10^(-4):10;
y = deval(sol,time_mesh);

figure
semilogx(time_mesh,y,'LineWidth',2)
title('Solution to the SIR Model Initial Value Problem')
lgd = legend('S(t)','I(t)','R(t)');
lgd.FontSize = 13;
xlabel('t')
ylabel('Functions S(t), I(t), and R(t)')


