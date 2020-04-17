function [x w] = GaussQuad(n)
% 
% Purpose: call qrule to get the nodes and weights of an 
%          n point Gauss--Legendre quadrature formula. 
% Note:    1) make sure to download qrule.m along with this 
%
wfun  = 1;
alpha = 0;
beta  = 0;
[x w] = qrule(n, wfun, alpha, beta);
