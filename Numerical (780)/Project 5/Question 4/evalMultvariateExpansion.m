function Y = evalMultvariateExpansion(lsq_data, coeff_vec, xi)
% function: evalMultvariateExpansion.m
% purpose: Given the coefficients from a (truncated) 
%          expansion, this function 
%          evaluates the expansion at the point xi.
%
% usage:   Y = evalMultvariateExpansion(lsq_data, coeff_vec, xi) 
%
% 
% Parameters:
%    Input: 
%       lsq_data     --- struct containing basic problem data 
%       coeff_vec    --- vector of exapansion coefficients
%       xi           --- point of evaluation
%
%    Output:
%       Y            --- value of the expansion at xi

Psi = PsiND(lsq_data, xi);
Y = dot(coeff_vec, Psi);
