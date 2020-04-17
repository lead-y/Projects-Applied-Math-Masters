function nf = newtFunc(h,tn,yn,tn1,yn1)
%h and t_n+1 should be passed into this function at each step so that it
%becomes a function of y

F1 = f(tn,yn);
F2 = f(tn1,yn1);

nf = yn1 - yn - (h/2)*(F1+F2);

end