function [] = plotFandApproxs(f,x)
%%% Given a function (f,g, or h) and x, plot the function and approximations of
%%% order p=1,...,6 in the same figure

figure
hold on

for p=1:6
    y = zeros(1,length(x));
        for i=1:length(x)
            y(i) = leastSq(f,p,x(i));
        end
    plot(x,y,'Linewidth',1.5)
end

yF = zeros(1,length(x));
    for i=1:length(x)
        yF(i) = feval(f, x(i));
    end
plot(x,yF,'k','LineWidth',1.5)
    
end

