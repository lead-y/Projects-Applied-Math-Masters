function [c, relerr] = lsqMultiDim(f, nord, ndim)
%  
% computes least squares approx to a multivariate function f
%
% plots the pointwise error if ndim = 2 and nord = 8
%      
% input:
%    f    --- function to be approximated (function handle)
%    nord --- approximation order
%    ndim --- dimension of the problem
%
%             f is a function f:S ---> R, with S = [-1,1]^ndim
%
% output:
%    c     --- coefficients of the least square approximation
%    relerr  --- (approximated) relative L2 error between f and its least squares approx
%
% note:  
%    this is an incomplete sketch to get you started on using the tools for
%    multivariate least squares problem; feel free to modify this code according
%    to your preference; 
%


% 
% get the basic components of the lsq solution method 
%
nquad_1d = nord + 1;
[lsq_data, quad_nodes, K] = lsqSetup(nord, nquad_1d, ndim); 
Nq = length(quad_nodes);

% get function evaluations at quad nodes.
% this assumes definition of f is vectorized  
for i = 1 : Nq
   d(i) = feval(f,quad_nodes(i,:));
end

%
% get the expansion coefficients
%
c = K * d(:);

%
% get and plot pointwise error for a bivariate function
%

%
% Compute the error on a high resolution grid 
%

nquad_1d_hires = 6;   % change if needed 
[quadrature] = getFullTensorQuad(ndim, nquad_1d_hires); %6^d quad grid

% extract nodes and weights
Xi = quadrature.nodes;
W = quadrature.weights;
Nq2 = quadrature.nquad;

for i = 1 : Nq2 
   xi = Xi(i, :); %ith quadrature node
   F(i) = f(xi); %function evaluared at ith node
   phi(i) = evalMultvariateExpansion(lsq_data, c, xi); %lsq approximation at node
end

%
%compuation of relative L2 error for a function into the reals
%

num = 0;
for j = 1:Nq2
    num = num + ( W(j) * ( F(j) - phi(j) )^2 );
end
dem = 0;
for j = 1:Nq2
    dem = dem + ( W(j) * (F(j))^2 );
end

relerr = num^(1/2) / dem^(1/2);

if and(ndim == 2, nord == 8)
    % evaluate the expansion at a set of points
x = [-1 : 0.01 : 1];
nx = length(x);
for i = 1 : nx
  for j = 1 : nx
     xi = [x(j), x(i)];
     Z(i, j) = evalMultvariateExpansion(lsq_data, c, xi);
  end
end
    % evaluate f at the set of points
for i = 1 : nx
  for j = 1 : nx
     xi = [x(j), x(i)];
     F(i,j) = f(xi);
  end
end 
    
    % get pointwise error at the points
for i = 1 : nx
  for j = 1 : nx
     E(i,j) = abs(F(i,j)-Z(i,j));
  end
end
    
    % plot
figure
contour(x,x,E)
title('Contour plot of the pointwise error for f_1 (p=8)')
xlabel('x_1')
ylabel('x_2')

end

end



%%Need to do
%get the coefficients v
%compute relative error v
%plot pointwise error of a bivariate function v
