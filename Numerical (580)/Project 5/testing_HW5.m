close
clear all

A = [0 1 1; 1 -6 0; 0 1 9];
As = A + 6*eye(3);
x0 = [0;1;0];
z = [0;0;1];
% y1 = A*x0;
% x1 = y1/norm(y1);
% mu1 = transpose(x1)*A*x1;
[L U P] = lu(As);
y = bkwdsub(U,z);
x = y/norm(y);
x1 = (7 / sqrt(2083) ) * y;
mu = transpose(x)*A*x;

% x = [3; 0; -1; 2];
% y = [-sqrt(14); 0;0;0];
% xmy = [3 + sqrt(14); 0; -1; 2];
% w = xmy / norm(xmy);
% P = eye(4) - 2*w*transpose(w);

% A = [2 2 1; 0 5 3; 0 0 0; 0 0 -1; 0 0 2];
% w = [-sqrt(5); -1; 2]/sqrt(10);
% Pinner = eye(3) - 2*w*transpose(w);
% P = eye(5);
% P(3:5,3:5) = Pinner;
% B=P*A;
% 
% [Q,R] = qr(A);

% eps = 10^(-5);
% eigs = [1 3 5 7 9];
% A = diag(eigs) + diag(ones(4,1),1);
% epsPowers = zeros(5,1);
% for i = 1:5
%     epsPowers(i) = eps^(i-1);
% end
% D = diag(epsPowers);
% B = inv(D)*A*D;