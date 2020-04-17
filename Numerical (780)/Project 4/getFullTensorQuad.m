function [quadrature] = getFullTensorQuad(ndim, numberOf1DNodes)
% function: getFullTensorQuad.m
% purpose: returns nodes and weights of full tensor multi-
%          dimensional quadrature to be used in a mutlti-dimensional least square problem.
%

% usage: quadrature = getFullTensorQuad(ndim, numberOf1DNodes, pc_type)
%
% input:
%    ndim           :   dimension
%    numberOf1DNodes:   number of nodes in each direction
%
% output:
%
%   quadrature      :   struct containing the quadrature data
%      quadrature.nodes     
%      quadrature.weights    
%      quadrature.nquad
% 


% lookup table for the quadrature points
ind = getQuadTable(numberOf1DNodes, ndim);
[nquad unused] = size(ind);

% get the 1D nodes and weights
[x1D w1D] = GaussQuad(numberOf1DNodes);


% multi-dimensional nodes
X = zeros(nquad, ndim);
for i = 1 : nquad
   X(i,:) = x1D(ind(i,:));
end
 
% multi-dimensional weights
W = zeros(nquad, 1);
for i = 1 : nquad

   prodw = 1;
 
   for j = 1 : ndim
        prodw = prodw * w1D(ind(i, j));
   end

   W(i) = prodw;

end

quadrature.nodes   = X;
quadrature.weights = W;
quadrature.nquad = nquad;
