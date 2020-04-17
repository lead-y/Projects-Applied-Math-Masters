function u = newton(F, DF, u0, atol, rtol, maxit) 
%
% solves the nonlinear system
%     F(u) = 0
%
% Input:  
%    F          --- function F (function handle)
%    DF         --- Jacobian of F
%    u0         --- u0    (initial iterate)
%    atol, rtol --- absolute and relative tolerance
%    maxit      --- max iterations allowed
%
% Output:
%    u          --- the approximate solution

res_norm0 = norm(F(u0));
res_norm = res_norm0;

% newton iterations
u = u0;
it = 0;
while it < maxit

   Fxc = F(u);
   DFxc = DF(u);
   step = -DFxc \ Fxc;
   u = u + step;

   % record iteration history
   Fxp = F(u);
   res_norm = norm(Fxp);

   it = it + 1;

   % exit loop if desired tolerance is achieved
   if res_norm <= (atol + rtol*res_norm0) 
      break;
   end
end