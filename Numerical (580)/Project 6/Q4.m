close
clear all

A = [2 2 0; 0 5 0; 0 0 0; 0 0 3; 0 0 -4];
w = [-5; 3; -4]; %un-normalized, x-y
omega = w/norm(w);
ww = w*transpose(w);
Psub = eye(3) - 2*omega*transpose(omega);
P = eye(5);
P(3:5,3:5) = Psub;
b1 = [3; 0; 0; 6; -8];
b2 = [0; 0; 1; 0; 0];
b3 = [0;0;0;0;1];
PA = P*A;

xstar1 = [3/2; 0; 2];

G = eye(5);
G(4:5,4:5) = [4/5 3/5; -3/5 4/5];

x_s = pinv(A)*b3;