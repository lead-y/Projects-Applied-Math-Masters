close
clear all

t = 0.05:0.1:0.95;
y = [0.4241, 0.3380, 0.2894, 0.2229, 0.1661, 0.1111, 0.1224, 0.0920, 0.0804, 0.0604];
f = @(t,q) q(2)*exp(-q(1)*t)*sin(pi/4);
J = @(q) sum( (y-f(t,q)).^2 );
q_initialIterate = [1,1];
n = length(t);
p = length(q_initialIterate);
[q_OLS, lsq_err] = fminunc(J,q_initialIterate);
var_OLS = 1/( n - p) * lsq_err;
time_grid = 0:10^(-2):1;
yplot = f(time_grid,q_OLS);


figure
hold on
plot(time_grid,yplot,'LineWidth',1.5);
scatter(t,y,'LineWidth',1.5);
title('Model fit to data')
xlabel('Time')
ylabel('Heat')
legend('Predicted by model','Measurement data')

chi = zeros(n,p);
for j = 1:n
    time = t(j);
    chi(j,1) = -time*q_OLS(2)*exp(-q_OLS(1)*time)*sin(pi/4);
    chi(j,2) = exp(-q_OLS(1)*time)*sin(pi/4);
end

Sigma = var_OLS*inv(transpose(chi)*chi);

SE = zeros(1,2);
SE(1) = sqrt(Sigma(1,1));
SE(2) = sqrt(Sigma(2,2));

t95 = tinv(.95,8);

confidence_matrix = zeros(p,2); %left col - lower CI, right col - upper CI
for k = 1:p
%lowerCI
confidence_matrix(k,1) = q_OLS(k) - t95*SE(k);
confidence_matrix(k,2) = q_OLS(k) + t95*SE(k);
end

Lindsay = mvnrnd(q_OLS, Sigma);

paramSamples = zeros(1000,2);
for i = 1:1000
    paramSamples(i,:) = mvnrnd(q_OLS, Sigma);
end

figure
scatter(paramSamples(:,1),paramSamples(:,2))
title('Random samples of q (n=1000)')
xlabel('q_1')
ylabel('q_2')



