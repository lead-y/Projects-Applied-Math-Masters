function fOutput = f(t,y)
%y' from the IVP


k1 = 1e8; k2 = 1e-8; k3 = 0.1;

fOutput = [ -k1*y(1)*y(2) + k2*y(3);
            -k1*y(1)*y(2) + (k2+k3)*y(3);
             k1*y(1)*y(2) - (k2+k3)*y(3);
             k3*y(3)];
end