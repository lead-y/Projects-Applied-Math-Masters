function [w_opt, u_wopt, k_wopt] = optimalw(w_list,n,h,f,u0,tol,a,b)
%finds best w given w_list: (I think best means fewest iterations, ie, lowest k)
%returns w_opt, as well as corresponding solution, u_wopt,
%and number of iterations, k_wopt.
    k_list = length(w_list);
    k_wopt = 9999; 
    w_opt = 9999; 
    u_wopt = 9999;
    for i = 1:length(w_list)
        [k_list(i), u] = poisson_mod_sor(n,h,w_list(i),f,u0,tol,a,b);
        if (k_list(i) < k_wopt)
            k_wopt = k_list(i);
            w_opt = w_list(i);
            u_wopt = u;
        end
    end
end