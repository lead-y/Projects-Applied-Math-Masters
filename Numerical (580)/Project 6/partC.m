function partC(m)
%make t:
t = 1:(pi - 1)/m:pi;

epsList = [0,0.1];
for i = 1:length(epsList)
    Eps = epsList(i);
    %make b
    data = transpose(sin(2*t) + 0.5*cos(5*t) + Eps*rand(size(t)));
    b = log(data);

    %make A
    A = zeros(m+1,2);
    A(:,1) = 1;
    A(:,2) = t;
 
    %solve normal equation:
    Coeffs = (transpose(A)*A)\(transpose(A)*b); %[tilde{a0}, a1],
    coeffs = Coeffs;
    coeffs(1) = exp(Coeffs(1));                %[a0,a1]

    %Plot computed solution against data values(b)
    t_p = 1 : (pi - 1)/100 : pi;
    y_calc = coeffs(1)*exp(coeffs(2)*t_p);

    figure
    hold on
    plot(t_p,y_calc)
    scatter(t,data)
    xlabel('t')
    ylabel('y(t)')
    title({'Exponential least squares approximation of y';['(\epsilon = ', num2str(Eps),')']})
    legend('approximation','true solution')
end

end