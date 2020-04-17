
clear all

h = 10^(-3); %change
k = 10;
nu = 10^(-5);
xgrid = 0:h:1;
n = length(xgrid);

Astar = diag(2*ones(1,n));
Astar = Astar + diag(-1*ones(1,n-1), 1);
Astar = Astar + diag(-1*ones(1,n-1),-1);

Aaster = diag(ones(1,n-1),1);
Aaster = Aaster + diag(-1*ones(1,n-1),-1);

A = k/h * Astar + nu/2 * Aaster;

F = h*ones(n,1);
U = A\F;

%Plot FEM solution:

tgrid = 0:10^(-5):1;
ugrid = zeros(size(tgrid));
ugrid(1) = 0;
for j = 2:length(tgrid)
    t = tgrid(j);
    index1 = ceil(t/h);
    index2 = index1+1;
    phi1 = (xgrid(index2)-t) / (xgrid(index2)-xgrid(index1));
    phi2 = (t-xgrid(index1)) / (xgrid(index2)-xgrid(index1));
    ugrid(j) = U(index1)*phi1 + U(index2)*phi2;
end 

%plot analytical solution:

ugrid_anal = ones(size(tgrid));
den = 1 - exp(nu/k);
for i = 1:length(tgrid)
    t=tgrid(i);
    num = 1 - exp(nu/k * t);
    ugrid_anal(i) = (1/nu) * (t - num/den);
end

figure
hold on
plot(tgrid,ugrid,'LineWidth',1.5)
plot(tgrid,ugrid_anal,'--','LineWidth',2)
title(["Comparison of finite element and"; "analytical solutions: Diffusion Dominated"])
xlabel('x')
ylabel('u')
legend('FEM solution','Analytical solution')

    
    
