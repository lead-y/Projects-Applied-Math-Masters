close
clear all

%%Part (b): Plots error for m = 4,8,16,32,64:
h = 1/100;
x = 0:h:1;
    
errors = zeros(length(x),5);

for i = 1:5
    m = 2^(i+1);
    yapprox = approxY(x,m);
    yexact = sin(pi*x);
    error = abs(yapprox - yexact);
    errors(:,i) = error;
    figure
    plot(x,error,'LineWidth',2)
    xlabel("x")
    ylabel("error")
    title({'Error in approximating sin(\pi x)'; ['interpolating with ',num2str(m+1),' coefficients (m = ',num2str(m),')']})
end

%%Part (c): Measures the amount of time it takes to find the coefficients
%%for m = 50,100,150,...,400:

x = 0:0.1:400;
theorerr = 3 * 10^(-8) * x.^3;

times = zeros(1,8);
for i = 1:8
    m = 50*i;
    times(i) = avgCPUtimes(m,10);
end

marray = 50:50:400;
figure
hold on
plot(marray,times,'*')
plot(x, theorerr,'k')
legend("Actual CPU time", "Approximating cubic function") 
title('Interpolation time vs m')
xlabel('m')
ylabel('CPU time')
z = polyfit(marray,times,3)

function e_avg = avgCPUtimes(m, nIter)
e_list = zeros(1,nIter);
for i = 1:nIter
    t = cputime;
    solve6(m);
    e = cputime-t;
    e_list(i) = e;
end
e_avg = sum(e_list)/nIter;
end


