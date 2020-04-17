close all
clear all

%%Part (a)
%%%%% Uses legpoly function to compute and plot pi_n (n=0,1,...,5) in one
%%%%% figure.

x = -1:10^(-3):1;
polys = legpoly(x,5);


figure
ylim([-1 1.3])
hold on
for n = 0:5
    plot(x,polys(:,n+1),'LineWidth',1.5)
end
legend('\pi_0','\pi_1','\pi_2','\pi_3','\pi_4','\pi_5')
legend('Orientation','horizontal')
title('Legendre polynomials, \pi_n')
xlabel('x')
ylabel('\pi_n (x)')
hold off

%%Part (c)
f = @(x) exp(x)*sin(pi*x);
g = @(x) 1/(1+x^2);
h = @(x) abs(x) + x^2*sin(pi*x);

x = -1:10^(-2):1;


%%%%%Provide both a table and a plot that for each p shows the
%%%%%approximation error \norm{f-\phi*}_2

error_of_f_approxs = calcError(f,6) %outputs the L2 error of f at approx level 1,...,6

%Plot:

figure
scatter(1:6,error_of_f_approxs,60,'filled','b')
xticks([1 2 3 4 5 6])
xt = get(gca, 'XTick');
set(gca, 'FontSize', 20)
xlabel('p')
ylabel('||f-\phi^*||_2')
title('L2 approximation error for p=1,...,6')

%%change markers
%etc

%%%%% Given a function (f,g, or h) and x, plot the function with approximations of
%%%%% order j=1,...,6 in the same Figure

plotFandApproxs(f,x)
legend('approx order 1','approx order 2','approx order 3','approx order 4','approx order 5','approx order 6', 'f = e^x sin(\pix)')
title('f(x) = e^x sin(\pi x) and least squares approximations of f')
xlabel('x')
ylabel('f(x)')

plotFandApproxs(g,x)
legend('approx order 1','approx order 2','approx order 3','approx order 4','approx order 5','approx order 6', 'g = 1/(1+x^2)')
title('g(x) = 1/(1+x^2) and least squares approximations of g')
xlabel('x')
ylabel('g(x)')

plotFandApproxs(h,x)
legend('approx order 1','approx order 2','approx order 3','approx order 4','approx order 5','approx order 6', 'h=|x| + x^2 sin(\pi x)')
title('h(x) = |x| + x^2 sin(\pi x) and least squares approximations of h')
xlabel('x')
ylabel('h(x)')

%%%%%Report the expansion coefficients for p=6 for each of the functions.

[~, fcoeffs] = leastSq(f,6,0)
[~, gcoeffs] = leastSq(g,6,0)
[~, hcoeffs] = leastSq(h,6,0)

