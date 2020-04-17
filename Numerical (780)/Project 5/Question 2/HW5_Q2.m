close
clear all

%Plot soln vector over time
start_time=cputime;
[t, y] = CrankNicSolver(2^12);
CrankTime=cputime-start_time
semilogx(t,y)
xlim([0, 100])
title('Solution Vector to IVP (step size = 100/2^{12})')
xlabel('t')
ylabel('y(t)')
legend('y1','y2','y3','y4')