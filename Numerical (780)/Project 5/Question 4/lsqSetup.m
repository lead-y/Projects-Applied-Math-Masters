function [lsq_data quad_nodes K] = lsqSetup(nord, nquad_1d, ndim)
% function: lsq_setup 
% purpose:  sets up all the basic setup for multi-dimensional least squares problem 
%
% usage: lsq_data = lsq_setup(nord, ndim, pc_type)
%
% input: 
% 
%    nord: order of the expansion (total polynomial order)
%    nquad_1d: the number of quadrature points in each dimension
%    ndim: the dimension of the problem; i.e., the number of variables in f(x1, x2, ..., xn)
%
% output: 
%
%    lsq_data: struct containing basic problem information:
%       lsq_data.ndim         ---   dimension
%       lsq_data.nord         ---   expansion order
%       lsq_data.psi          ---   1D orthogonal polynomials at quadrature nodes
%       lsq_data.multIndex    ---   the multi-indicies 
%       lsq_data.nBasis       ---   number of terms in expansion
%       lsq_data.psiMultiDSq  ---   vector of mean squares of the multi-dim 
%                                   polynomials
%    K : projection matrix used to compute projection into a multi-dimensional basis

lsq_data.ndim = ndim;
lsq_data.nord = nord;

%
% basis setup
%
% multi-indices and the number of terms in expansion
[lsq_data.multiIndex, lsq_data.nBasis] = initMultiIndex(nord, ndim);

% norms squares
lsq_data.psiMultiDSq = evalBasisNormsSquared(nord, ndim);

%
% quadrature setup
%
[quadrature] = getFullTensorQuad(ndim, nquad_1d);
quad_nodes = quadrature.nodes;

%
% projection matrix
%
K = getProjectionMatrix(lsq_data, quadrature);
