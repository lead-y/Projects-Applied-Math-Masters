close
clear all

D = [3,0,0;0,2,0;0,0,2];
L = zeros(3);
L(3,2) = 1;
U = [0,1,-1;0,0,-1;0,0,0];
b= [3;2;2];
x0 = [1;-1;1];

%Jacobi
x1_J = inv(D) * (L+U)* x0 + inv(D)*b;

%Gauss-Seidel
invDmL = inv(D-L);
x1_GS = invDmL * U * x0 + invDmL*b;

%R_J
R_J = inv(D)*(L+U);

%R_GS
R_GS = inv(D-L)*U;

%R_SOR(omega)
omega = 1/2;
R_SOR = inv(D-omega*L) * ((1-omega)*D + omega*U);
sor1 = inv(D-omega*L);
Rsor = [ 1 - omega, omega/3, -omega/3;
        0, 1-omega, -omega/2;
        0, omega*(1-omega)/2, -omega^2/4 + 1-omega];

