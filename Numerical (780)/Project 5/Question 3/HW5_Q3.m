clear
close all

starttime = cputime;

%IVP:
k = [1e8, 1e-8, 0.1];

dy = @(t,y)   [ -k(1)*y(1)*y(2) + k(2)*y(3)
              -k(1)*y(1)*y(2) + (k(2)+k(3))*y(3)
               k(1)*y(1)*y(2) - (k(2)+k(3))*y(3)
               k(3)*y(3)];
y0 = [ 5e-7
       2e-7
       0
       0];
%


%solMat -- 4x3 matrix with sol data entries. Rows:solvers; Cols:tolerances

tspan = [0,100];

tol = [1e-6, 1e-8, 1e-10];

%Runs ode45 at 3 tols: 
for i = 3:-1:1
    options = odeset('RelTol',tol(i),'AbsTol',tol(i));
    sol = ode45(dy,tspan,y0,options);
    solMat(1,i) = sol;
end

%Runs ode15s at 3 tols: 
for i = 3:-1:1
    options = odeset('RelTol',tol(i),'AbsTol',tol(i));
    sol = ode15s(dy,tspan,y0,options);
    solMat(2,i) = sol;
end

%Runs ode23tb at 3 tols: 
for i = 3:-1:1
    options = odeset('RelTol',tol(i),'AbsTol',tol(i));
    sol = ode23tb(dy,tspan,y0,options);
    solMat(3,i) = sol;
end

%Runs ode23s at 3 tols:
for i = 3:-1:1
    options = odeset('RelTol',tol(i),'AbsTol',tol(i));
    sol = ode23s(dy,tspan,y0,options);
    solMat(4,i) = sol;
end

xGrid = 0:0.01:100;

% %Plot ode45 stuff:
% %%%tol = 10^-8:
% figure
% y_45_8 = deval(solMat(1,2),xGrid);
% semilogx(xGrid,y_45_8)
% title('ode45, tolerance = 10^{-8}')
% ylabel('y(t)')
% xlabel('t')
% %%%tol = 10^-10:
% figure
% y_45_10 = deval(solMat(1,3),xGrid);
% semilogx(xGrid,y_45_10)
% title('ode45, tolerance = 10^{-10}')
% ylabel('y(t)')
% xlabel('t')
% 
% %Plot ode15s stuff:
% %%%tol = 10^-6:
% figure
% y_15s_6 = deval(solMat(2,1),xGrid);
% semilogx(xGrid,y_15s_6)
% title('ode15s, tolerance = 10^{-6}')
% ylabel('y(t)')
% xlabel('t')
% %%%tol = 10^-8:
% figure
y_15s_8 = deval(solMat(2,2),xGrid); %Looks the same as 10^-10
semilogx(xGrid,y_15s_8)
title('ode15s, tolerance = 10^{-8}')
ylabel('y(t)')
xlabel('t')
legend('y1','y2','y3','y4')
% 
% %Plot ode23tb stuff:
%%%tol = 10^-6
figure
y_23tb_6 = deval(solMat(3,1),xGrid); 
semilogx(xGrid,y_23tb_6)
title('ode23tb, tolerance = 10^{-6}')
ylabel('y(t)')
xlabel('t')
legend('y1','y2','y3','y4')
% %%%tol = 10^-8
% figure
% y_23tb_8 = deval(solMat(3,2),xGrid); %10^-10 looks about the same
% semilogx(xGrid,y_23tb_8)
% title('ode23tb, tolerance = 10^{-8}')
% ylabel('y(t)')
% xlabel('t')
% 
% %Plot ode23s stuff:
% %%%tol = 10^-6
% figure
% y_23s_6 = deval(solMat(4,1),xGrid);
% semilogx(xGrid,y_23s_6)
% title('ode23s, tolerance = 10^{-6}')
% ylabel('y(t)')
% xlabel('t')
% %%%tol = 10^-8
% figure
% y_23s_8 = deval(solMat(4,2),xGrid); %10^-10 looks about the same
% semilogx(xGrid,y_23s_8)
% title('ode23s, tolerance = 10^{-8}')
% ylabel('y(t)')
% xlabel('t')

%Number of Function Evals and Number of Steps Taken

nFevals = zeros(4,3);
nSteps = zeros(4,3);
for solver = 1:4
    for tol = 1:3
        Sol = solMat(solver,tol);
        nFevals(solver,tol) = Sol.stats.nfevals;
        nSteps(solver,tol) = Sol.stats.nsteps;
    end
end

endtime = cputime - starttime;

%Comment on:
    %solns obtained with the given tolerences
    %number of steps taken
    %number of function evaluations
    %provide plots as needed
    %Compare to Crank-Nicolson from last question (see latex doc for
    %details)
    
    %ode45:
% % options = odeset('RelTol',1e4);
% % sol = ode45(dy,tspan,y0,options);
% % 
% % h=100/(1e4); 
% % t = 0:h:100;
% % y = deval(sol,t);
% % plot(t,y)
    
    