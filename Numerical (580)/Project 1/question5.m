close
clear all 

n = 10;
errMat = zeros(3,n);
for j=1:n
    errMat(1,j) = j;
    errMat(2,j) = piErr(pi1(j));
    errMat(3,j) = piErr(pi2(j));
end
%The above error matrix shows that when using pi2, we can reach error <
%10^(-6) using 7 terms (or more).


% n=10^6;
% piApprox = pi1(n)
% err = piErr(piApprox) %Gives the error using method 1 with 10^6 terms

%The computer time needed to approximate pi to 10 terms:
pi1_10 = timeit(@() pi1(10))
pi2_10 = timeit(@() pi2(10))
pi1_acc = timeit(@() pi1(10^6))
pi2_acc = timeit(@() pi2(7))



% terms=1;
% while (errPass(pi1(terms)) == false && terms < 10^4) %Gives the min # terms needs to get acceptable error.
%     terms=terms+1;
% end


function err = piErr(piApprox)
%Finds the absolute error given an approximation of pi
    err = abs( piApprox - pi );
end

function pass = errPass(piApprox)
%determines whether the error of a pi approximation is less than 10^-6
    err = piErr(piApprox);
    if err < 10^(-6)
        pass = true;
    else
        pass = false;
    end
end

function p = pi1(terms)
%method 1 for approximating pi
    inner = 0;
    for n = 0:(terms-1)
        inner = inner + (-1)^n * (1/(1+2*n));
    end
    p = 4*inner;
end

function p = pi2(terms)
%method 2 for approximating pi
    inner = 0.5; 
    for n=1:(terms-1)
        num = dbFact(2*n-1) * (1/2)^(2*n+1);
        dem = dbFact(2*n) * (2*n+1);
        inner = inner + num/dem;
    end
    p = 6*inner;
end

function dbf = dbFact(n)
% (n)!!
    if mod(n,2)==0
        dbf = prod(n:-2:2);
    elseif mod(n,2) == 1
        dbf = prod(n:-2:1);
    else
        error('dbFact only accepts integers')
    end
end
