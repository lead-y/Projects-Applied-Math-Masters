close
clear all

%Approximate g(x) using lsqMultiDim.
    %for order n = 1,...,6

    %lsqMultiDim will output the coefficients of the least-squares
    %approximation and  the relative error || g - \phi ||_2 / ||g||_2

G = @(x) g(x);

[c1,relerr1] = lsqMultiDim(G,1,3);
[c2,relerr2] = lsqMultiDim(G,2,3);
[c3,relerr3] = lsqMultiDim(G,3,3);
[c4,relerr4] = lsqMultiDim(G,4,3);
[c5,relerr5] = lsqMultiDim(G,5,3);
[c6,relerr6] = lsqMultiDim(G,6,3);

relerr = [relerr1, relerr2, relerr3, relerr4, relerr5, relerr6];

figure
plot = semilogy(1:6,relerr,'g','LineWidth',1.5);
plot.Marker = '*';
plot.MarkerEdgeColor = 'k';
title('Relative Error of the L_2 Approximation of g vs Approximation Order')
xlabel('Order of the Approximation')
ylabel('Relative Error, E_n')

figure
plot(c6)


