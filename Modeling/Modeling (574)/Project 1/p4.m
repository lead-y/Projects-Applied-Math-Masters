close
clear all
    
G = 392.00;
E = 311.127;
F = 349.23;
D = 293.66;
R = 0;          %rest

fs = 1000;
et = 0: 1/fs :0.25;     %eigth note
ht = 0: 1/fs :1;        %half note

gy = sin(2*pi*G*et);    %G - 1/8 
ey = sin(2*pi*E*ht);    %E - 1/2
fy = sin(2*pi*F*et);    %F - 1/2
dy = sin(2*pi*D*ht);    %D - 1/2
ry = sin(2*pi*R*et);    %rest - 1/8

a = [ry,gy,gy,gy,ey,ry,fy,fy,fy,dy];

sound(a,fs)