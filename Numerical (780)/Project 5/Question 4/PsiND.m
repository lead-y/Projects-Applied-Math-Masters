function Psi = PsiND(lsq_data, xi)
% function: PsiND.m
% purpose:  return the multidimensional polynomials \Psi_k
%           evaluated at xi.
%
% usage: Psi = Psi_nD(lsq_data, xi)
% 
% input paremeters:
% 
%    lsq_data : struct containing basic problem info
%    xi   : the evaluation point 
%
% output:
%
%    Psi  : a vector with Psi(k) = \Psi_k(xi), k=1, ..., 1+P
%
% note: here the modes of the expansion are 
%       numbered 1, ..., P+1 because Matlab array 
%       index must begin with 1. 

% check input
if length(xi) ~= lsq_data.ndim
   fprintf('error: input vector must be %i dimensional\n', lsq_data.ndim);
   Psi = 0; 
   return
end

% get the little psi's: 
psi = psi1D(xi, lsq_data.nord);

% get the mult-dim Psi's
ndim = lsq_data.ndim;
multiIndex = lsq_data.multiIndex;
nBasis = lsq_data.nBasis;
Psi = ones(1, nBasis);

% compute the multi-dimensional basis functions
for i = 1 : ndim
    Psi = Psi .* psi(i, multiIndex(1 : nBasis, i) + 1);
end
