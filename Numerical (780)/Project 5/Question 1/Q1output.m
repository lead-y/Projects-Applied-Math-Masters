function [resultsMat] = Q1output(dy,y0,Y)
%Input: dy -- function handle of y'; y0 -- the value of y(0) given in IVP; Y -- function handle of true solution to IVP
%Output: resultsMat == matrix output with 7 rows and 3 cols: h, E_h, ratio E_2h/E_h

resultsMat = zeros(7,3);
for i = 1:7
    h = 5/(2^i);
    [~, Eh] = heunSolver(i,dy,y0,Y);
    
    resultsMat(i,1) = h;
    resultsMat(i,2) = Eh;
end

for i = 2:7
    resultsMat(i,3) = resultsMat(i-1,2) / resultsMat(i,2);
end

end

