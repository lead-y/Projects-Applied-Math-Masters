function df = DF(h,y)
%Gives the Jacobian of the newton's function

y1 = y(1); y2 = y(2);
k1 = 1e8; k2 = 1e-8; k3 = 0.1;

df = [1 + h*k1*y2/2, h*k1*y1/2, -h*k2/2, 0;
      h*k1*y2/2, 1+h*k1*y1/2, -(h/2)*(k2+k3), 0;
      -h*k1*y2/2, -h*k1*y1/2, 1+(h/2)*(k2+k3), 0;
      0, 0, -h*k3/2, 1];

end