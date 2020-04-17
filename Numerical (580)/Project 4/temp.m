clear
close all

a = -47;
b = -1;

A = [3 -2 a; 1 -1 0; 0 b -6];
vals = eig(A)

%ab<=46; 15 is too high when one is negative; when both are negative same
%as both positive