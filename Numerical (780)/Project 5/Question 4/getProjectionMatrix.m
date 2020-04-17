function K = getProjectionMatrix(lsq_data, quadrature)
% function: getProjectionMatrix
%  
% purpose: Compute the projection matrix which is used to 
%          project data into a multi-dimensional Legendre basis.
%
% Usage: K = getProjection(lsq_data, quadrature)
%
% input:
%    lsq_data     --- struct containing basic pc parameters    
%    quadrature --- stuct containing nodes and weights of multi-dimensional
%                   quadrature
%
%   
% output:
%    K      --- the Projection matrix
%       K_{ij} = W_j * Psi_i(X_j) / <Psi_i^2>
%         
% note: Given a vector F of evaluations of a function f
%       on quadrature nodes X_j, F_j = f(X_j), 
%       projection of X into the multi-dimensional Legendre basis is accomplished 
%       through the matrix vector product
%            c = K * F
%       here c denotes the vector of spectral coeffs of f.

% get the needed info from lsq_data:
ndim = lsq_data.ndim;
nord = lsq_data.nord;
nBasis  = lsq_data.nBasis;
psiMultiDSq = lsq_data.psiMultiDSq;

% extract the mult-dimensional nodes and weights of quadrature
X = quadrature.nodes;
W = quadrature.weights;
nquad = quadrature.nquad;

% compute the projection matrix
K = zeros(nBasis, nquad);
for j = 1 : nquad

    % multi-dimensional polynomials at quadrature nodes
    Psi_Xj = PsiND(lsq_data, X(j, :));

    % jth row of K
    K(:, j) = W(j) * Psi_Xj(:) ./ psiMultiDSq(:);
end

