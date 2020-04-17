close
clear all

alpha = 4.8;
R = [exp(-1), -exp(1), -1, -1, -10;
    0, sin(pi/4), 10^4, -1, -1;
    0, 0, -0.1, -1, 1;
    0, 0, 0, 1-exp(-2), -1;
    0, 0, 0, 0, 1-sin(alpha*pi)];

[eigenvectors, eigenvalues] = eig(R);
eigenvalues