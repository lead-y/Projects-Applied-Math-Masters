clear
close all

A = [1 0 1; 0 1 0];
aha = transpose(A)*A;
[vecs,sigsq] = eig(aha);

x1 = [1/sqrt(2); 0; 1/sqrt(2)];

omega = [1/sqrt(2) - 1; 0; 1/sqrt(2)];
omega = omega/norm(omega);
P = eye(3) - 2*omega*transpose(omega);
Mx2 = P*[0;1;0];
Mx3 = P*[0;0;1];

Lx2 = [0;1;0];
Lx3 = [-(1-sqrt(2))/(2-sqrt(2)); 0; 1 - 1/(2-sqrt(2))];

V = [x1 Lx2 Lx3];
U = eye(2);
Sigma = transpose(U)*A*V;

Sigma_p = [1/sqrt(2) 0; 0 1; 0 0];
A_p = V*Sigma_p*transpose(U);

b = [2;1];
x = A_p*b;
Mx = A\b;
