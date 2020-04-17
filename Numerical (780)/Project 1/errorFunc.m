function [err] = errorFunc(p_n,f)
%Outputs error |p_n(x)-f(x)| given inputs p_n, f.
%   p_n and f are function handles

err = @(x) p_n(x) - f(x);

end

