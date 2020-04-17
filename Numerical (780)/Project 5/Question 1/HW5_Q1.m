
%problem 1:
dy1 = @(x,y) y/4 * (1-y/20);
y0_1 = 1;
Y1 = @(x) 20 / (1 + 19 * exp(-x/4) );

p1 = Q1output(dy1,y0_1,Y1);


%problem 2:

dy2 = @(x,y) -y + 2*cos(x);
y0_2 = 1;
Y2 = @(x) cos(x) + sin(x);

p2 = Q1output(dy2,y0_2,Y2);