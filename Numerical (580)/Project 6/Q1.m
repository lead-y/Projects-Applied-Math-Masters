clear
close all

w = [1; 2; 3; 4];
A = transpose(w)*w;
B = w*transpose(w);
x = [8; -10; 9; 4.5];
myeig = sum(w.^2);
Bp = pinv(B);