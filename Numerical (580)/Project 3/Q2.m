close
clear all

%one-norm
h = 10^(-5);
xa = -1:h:0;
ya = xa+1;
xb = 0:h:1;
yb = -xb+1;
xc = -1:h:0;
yc = -xc-1;
xd = 0:h:1;
yd = xd-1;
figure
plot(xa,ya,'k',xb,yb,'k',xc,yc,'k',xd,yd,'k','LineWidth',2)
xlim([-1.5,1.5])
ylim([-1.5,1.5])
xlabel("x_1")
ylabel("x_2")
title("||x||_1 = 1 where x = (x_1,x_2)")

%two-norm
figure
circle(0,0,1)
xlabel("x_1")
ylabel("x_2")
title("||x||_2 = 1 where x = (x_1,x_2)")

%infinity-norm
figure
rectangle('Position',[-1,-1,2,2],'LineWidth',2)
xlim([-1.5,1.5])
ylim([-1.5,1.5])
xlabel("x_1")
ylabel("x_2")
title("||x||_\infty = 1 where x = (x_1,x_2)")




function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'k','LineWidth',2);
xlim([-1.5*r,1.5*r])
ylim([-1.5*r,1.5*r])
hold off
end