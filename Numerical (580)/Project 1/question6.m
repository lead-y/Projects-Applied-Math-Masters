close
clear all

plotM1()
plotM2()
tableMatrix1 = generateTable(1);
tableMatrix2 = generateTable(2);

function tM = generateTable(func)
    if func == 1
        f = @(x) x^2;
        x0 = 1.8;
        fpExact = 3.6;
    elseif func == 2
        f = @(x) exp(x) * sin(x);
        x0 = 0.55;
        fpExact = 2.3836;
    end
    
    tM = zeros(5,10);
    
    for i = 1:5
        h = 0.1 / 2^(i-1);
        
        y = fp(f,x0,h);         %approx of f'(x0) given h using all methods
        absErr = abs( y - fpExact );
        relErr = absErr / fpExact;
        
        tM(i,1) = 10 * 2^(i-1);
        for m = 1:3             %enters the absErrs in the matrix
            j = 2+3*(m-1);
            tM(i,j) = absErr(m);
        end
        for m = 1:3
            j = 3*m;
            tM(i,j) = relErr(m);
        end
        if i == 1
            continue
        end
        for j = 4:3:10
            tM(i,j) = tM(i-1,j-1) / tM(i, j-1);
        end
    end
end

function plotM1()
errMat = fErrs(1);
x = errMat(1,:);      %h's
y1 = errMat(2,:);     %err using method 1
y2 = errMat(3,:);     %err using method 2
y3 = errMat(4,:);     %err using method 3

figure
loglog(x,y1,'x',x,y2,'o',x,y3,'+','LineWidth',1.5)
title('Error in approximation of f''(1.8) where f(x) = x^2 with step-size h, using three methods')
xlabel('h')
ylabel('Approximation Error')
legend('Method 1','Method 2','Method 3')
end

function plotM2()
errMat = fErrs(2);
x_2 = errMat(1,:);
y1_2 = errMat(2,:);
y2_2 = errMat(3,:);
y3_2 = errMat(4,:);

figure
loglog(x_2,y1_2,'x',x_2,y2_2,'o',x_2,y3_2,'+','LineWidth',2)
title('Error in approximation of f''(0.55) where f(x) = e^x sin x with step-size h, using three methods')
xlabel('h')
ylabel('Approximation Error')
legend('Method 1','Method 2','Method 3')
end

function errMat = fErrs(func)
    if func == 1
        f = @(x) x^2;
        x0 = 1.8;
        fpExact = 3.6;
    elseif func == 2
        f = @(x) exp(x) * sin(x);
        x0 = 0.55;
        fpExact = 2.3836;
    else
        error('fErrs only accepts input values 1 and 2')
    end
    for i = 51:-1:1
        h = 0.1 / (2^(i-1));
        y = fp(f,x0,h);                 %the errors for each method using h
        errMat(1,i) = h;
        errMat(2,i) = abs( y(1) - fpExact );   %the error using method 1 and h
        errMat(3,i) = abs( y(2) - fpExact );   %the error using method 2 and h
        errMat(4,i) = abs( y(3) - fpExact );   %the error using method 3 and h
    end
end

function y = fp(f,x0,h)
%approximates f'(x0) given func handle x, x0, h for each method method
    y = zeros(3,1);
    y(1) = method1(f, x0, h);
    y(2) = method2(f, x0, h);
    y(3) = method3(f, x0, h);
end

function yp = method1(f, x0, h)
%approximates f'(x0) given func handle f, x0, and h using method 1
yp = ( feval(f,x0+h) - feval(f,x0) )/h;
end

function yp = method2(f, x0, h)
%approximates f'(x0) given func handle f, x0, and h using method 2
yp = ( feval(f,x0+h) - feval(f,x0-h) ) / (2*h);
end

function yp = method3(f, x0, h)
%approximates f'(x0) given func handle f, x0, and h using method 3
yp = ( feval(f,x0) - feval(f,x0-h) ) /h;
end