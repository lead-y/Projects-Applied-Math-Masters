clear
close all

%Q6
R1jac = zeros(3);
R1jac(2,3) = -2;
R1jac(3,2) = 2;
e = eig(R1jac);

R1_gs = zeros(3);
R1_gs(2,3) = -2;
R1_gs(3,3) = -4;
e1_gs = eig(R1_gs);
