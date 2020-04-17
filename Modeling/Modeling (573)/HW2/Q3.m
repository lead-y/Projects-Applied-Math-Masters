close
clear all

t = 0:0.01:100;
tRange = [0 100];
tic
sol45 = ode45(@F, tRange,[0.5, 0.5, 0.5]);
time45 = toc;
tic
sol15s = ode15s(@F, tRange,[0.5, 0.5, 0.5]);
time15s = toc;
Yp45 = deval(sol45,t);
Yp15s = deval(sol15s,t);

%plot using ode45
figure
loglog(t,Yp45(1,:),t,Yp45(2,:),t,Yp45(3,:),'LineWidth',2)
xlabel('t')
ylabel('y(t)')
title('Solution to ODE model of a chemical system using ode45')
legend('y1','y2','y3')

%plot using ode15s
figure
loglog(t,Yp15s(1,:),t,Yp15s(2,:),t,Yp15s(3,:),'LineWidth',2)
xlabel('t')
ylabel('y(t)')
title('Solution to ODE model of a chemical system using ode15s')
legend('y1','y2','y3')

%number of time steps taken by each method
nSteps45 = length(sol45.x);
nSteps15s = length(sol15s.x);

%Jacobian eigenvalues plot
eigvals = zeros(3,length(t)); %each column belongs to a time-step.
for i = 1:length(t)
    y = Yp15s(:,i);
    jac = sysJac(y(1),y(2),y(3));
    eigvals(:,i) = eig(jac);
end

figure
hold on
scatter(t,eigvals(1,:),2,[0 0.4470 0.7410])
scatter(t,eigvals(2,:),2,[0 0.4470 0.7410])
scatter(t,eigvals(3,:),2,[0 0.4470 0.7410])
hold off
xlabel('t')
ylabel('eigenvalues')
title('Eigenvalues of system Jacobian over time')
%plot(t,eigvals(1,:),t,eigvals(2,:),t,eigvals(3,:),'LineWidth',2)

function Yp =  F(t,Y)
eps = 10^(-2);
y1 = Y(1);
y2 = Y(2);
y3 = Y(3);
y1p = -5*y1/eps - y1*y2/eps + y2*y3 +  5*y2^2/eps + y3/eps - y1;
y2p = 10*y1/eps - y1*y2/eps - y2*y3 - 10*y2^2/eps + y3/eps + y1;
y3p = y1*y2/eps - y2*y3 - y3/eps + y1;
Yp = [y1p; y2p; y3p];
end

function J = sysJac(y1,y2,y3)
eps = 10^(-2);
J = zeros(3,3);
J(1,1) = -5/eps - y2/eps - 1;
J(2,1) = 10/eps - y2/eps + 1;
J(3,1) = y2/eps + 1;
J(1,2) = -y1/eps + y3 + 10*y2/eps;
J(2,2) = -y1/eps - y3 - 20*y2/eps;
J(3,2) = y1/eps - y3;
J(1,3) = y2 + 1/eps;
J(2,3) = -y2 + 1/eps;
J(3,3) = -y2 - 1/eps;
end