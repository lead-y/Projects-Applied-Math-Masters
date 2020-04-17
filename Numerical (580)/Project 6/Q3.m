close
clear all

B1 = [2 1 -1; 0 -3 2; 0 0 1];
b21 = [2;-1;1];
A1 = zeros(6,3);
A1(3:5,:) = B1;
b1 = [1; -1; 2; -1; 1; 1];
invB1 = inv(B1);
xstar1 = invB1*b21;
residual1 = b1 - A1*xstar1;

B2 = [2 -1 0; -1 2 -1; 0 -1 2];
b22 = [0;0;0];
A2 = zeros(5,3);
A2(1:3,:) = B2;
b2 = [0;0;0;-8;1];
invB2 = inv(B2);
xstar2 = invB2*b22;
residual2 = b2 - A2*xstar2;