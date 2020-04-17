
f1 = @(x) exp(x(1)) / (1 + x(2)^2);
f2 = @(x) sin(pi*x(1)) + sin(pi*x(2))^2 + 1/10 * x(3)^4 * sin(2*pi*x(1));
f3 = @(x) (exp(x(1))-x(2))^2 + 10*(x(2)-exp(x(3)))^4 + sin(pi*(x(3)-x(4)))^3;

relErrMat = zeros(8,3);

for p=1:8
    [x1, y1] = lsqMultiDim(f1,p,2);
    relErrMat(p,1) = y1;
    [x2, y2] = lsqMultiDim(f2,p,3);
    relErrMat(p,2) = y2;
    [x3, y3] = lsqMultiDim(f3,p,4);
    relErrMat(p,3) = y3;
    if p==8
       f1_coeffs = x1;
       f2_coeffs = x2;
       f3_coeffs = x3;
    end
end

p = 1:8;
figure
hold on
scatter(p, relErrMat(:,1))
scatter(p, relErrMat(:,2))
scatter(p, relErrMat(:,3))
legend('f_1','f_2','f_3')
xlabel('p')
ylabel('E_{rel}^p')
title('Relative error of least square approximating polynomials of total order p')

