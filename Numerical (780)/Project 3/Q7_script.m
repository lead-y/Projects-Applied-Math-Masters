close
clear all

% % n=4;    %The number of interpolation points is equal to n+1.
% % is
f = @(t) 1/(1+t^2);     %function to be interpolated
% % x_e = -5:(10/n):5;      %equidistant interpolation nodes
% % %x_c =                  %chebyshev interpolation nodes
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
t = -5:10^(-2):5;                   %input to the functions to be plotted
% % 
% % %  equidistant node interpolant evaulated at values of t
% % yN_equi = zeros(1, length(t));
% % for i = 1:length(yN_equi)
% %     yN_equi(i) = interpol_Newtons(f,x_e,t(i));
% % end
% % 
% % %  Chebyshev node interpolant evaluated at values of t
% % %yN_cheby = ;

hold on
%  exact function evaluated at values of t
yF = zeros(1,length(t));
for i = 1:length(yF)
    yF(i) = feval(f,t(i));
end
plot(t,yF,'k','LineWidth',1)
for n = 2:2:8
    plotInterpolant(n,'e',f,'g')
    plotInterpolant(n,'c',f,'b')
end
ylim([-1.5 1.5])
xlabel('t')
ylabel('f(t)')
title('Interpolation of f(t) = 1/(1+t^2) using equidistant and Chebyshev nodes (number of nodes = n+1)')
legend('f(t) = 1/(1+t^2)','Interpolant (n=2,4,6,8) with equidistant nodes', 'Interpolant (n=2,4,6,8) with Chebyshev nodes')