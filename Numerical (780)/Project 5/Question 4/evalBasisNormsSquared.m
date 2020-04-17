function [psiMultiDSq, nBasis] = evalBasisNormsSquared(nord, ndim)
% function: evalBasisNormsSquared.m
% purpose:  return the norm squared of the 
%           multidimensional Legendre polynomials \Psi_k.
%
% usage: [psiMultiDSq, nBasis] = evalBasisNormsSquared(nord, ndim)
%
% input paremeters:
%
%    nord : order of the expansion
%    ndim : parameter dimension
%
% output:
%
%    psiMultiDSq: square norms <Psi_k^2> for k = 0, ..., nBasis-1 
%    nBasis: number of terms in the expansion

[multiIndex, nBasis] = initMultiIndex(nord, ndim);
psiMultiDSq = zeros(nBasis, 1);

norm1d = @(n)( 2.0 / (2*n + 1.0) );

% compute norm squares of Psi using the norms squares of 
% 1D polynomials
for k = 1 : nBasis
   pprod = 1.0;
   for j = 1 : ndim
      pprod = pprod * norm1d(multiIndex(k,j));
   end
   psiMultiDSq(k) = pprod;
end

