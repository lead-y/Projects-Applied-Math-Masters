clear
close all

data_aEquals1 = getData(1);
data_aEquals100 = getData(100);


% % %for each n, generate u and f for the grid using given equations. 
% % %Use h = 1/n. Also generate u0 given size of u. Use zeros.
% % %-- f is dependent on a
% % function data_table = getData(a)
% %     %independent of a and n and omega:
% %     n_list = [20,40,80,160];
% %     %n_list = [20];
% %     b = 2;
% %     tol = 10^(-2);
% %     omega_list = 1.9:-0.1:1; %still needs one more
% %     %
% %     %independent of n and omega (but not a):
% %     data_table = zeros(5,length(n_list));
% %     %
% %     %independent of omega (dependent on n and a):
% %     for index = 1:length(n_list)
% %         n = n_list(index);
% %         data_table(1,index) = n;
% %         u0 = ones(n+1,n+1);
% %         h = 1/n;
% %         x = 0:h:1;
% %         y = x;
% %         %make u_true: -- this will be used for the boundary case. 
% %         u_true = u0;
% %         for i = 1:length(x)
% %             for j = 1:length(y)
% %                 u_true(i,j) = exp(2*y(j)) * sin(pi*x(i));
% %             end
% %         end
% %         %give u0 the right boundaries:
% %         u0(1,:) = u_true(1,:); u0(n+1,:) = u_true(n+1,:); 
% %         u0(:,1) = u_true(:,1); u0(:,n+1) = u_true(:,n+1);
% %         %
% %         %assign f:
% %         f = u0;
% %         for i = 1:length(x)
% %             for j = 1:length(y)
% %                 f(i,j) = exp(2*y(j)) * ( (-pi^2 + 4 - 2*b)*sin(pi*x(i)) + a*pi*cos(pi*x(i)) );
% %             end
% %         end
% %         %dependent on omega:
% %         theor_omega = 2 / ( 1 + pi/(n+1) );
% %         omega_list(length(omega_list)+1) = theor_omega;
% %         %Find the optimal omega and fill in the data table for this value
% %         %of n:
% %         [w_opt, u_wopt, k_wopt] = optimalw(omega_list,n,h,f,u0,tol,a,b);
% %         data_table(2,index) = w_opt;
% %             %calculate the error: (defined as error(u) = || u - u_true ||_2 / || u_true ||_2)
% %         data_table(3,index) = norm(u_wopt-u_true,2)/norm(u_true,2);
% %         data_table(4,index) = k_wopt;
% %         %Compare to Gauss-Seidel. Note that GS is the same as SOR(1).
% %         k_GS = poisson_mod_sor(n,h,1,f,u0,tol,a,b);
% %         data_table(5,index) = k_GS;
% %     end
% % end



%For each case, get the error, number of iterations, and 

%Make sure to include 1 and optimal from class in the w_list. Also,
%1.9,1.8,...,1.


% % function [w_opt, u_wopt, k_wopt] = optimalw(w_list,n,h,f,u0,tol,a,b)
% % %finds best w given w_list: (I think best means fewest iterations, ie, lowest k)
% % %returns w_opt, as well as corresponding solution, u_wopt,
% % %and number of iterations, k_wopt.
% %     k_list = length(w_list);
% %     k_wopt = 9999; 
% %     w_opt = 9999; 
% %     u_wopt = 9999;
% %     for i = 1:length(w_list)
% %         [k_list(i), u] = poisson_mod_sor(n,h,w_list(i),f,u0,tol,a,b);
% %         if (k_list(i) < k_wopt)
% %             k_wopt = k_list(i);
% %             w_opt = w_list(i);
% %             u_wopt = u;
% %         end
% %     end
% % end