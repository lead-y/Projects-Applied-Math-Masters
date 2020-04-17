function partB(n,m)
%make t:
t = 1:(pi - 1)/m:pi;

epsList = [0,0.1];
for i = 1:length(epsList)
    Eps = epsList(i);
    %make b
    b = transpose(sin(2*t) + 0.5*cos(5*t) + Eps*rand(size(t)));

    %make A
    A = zeros(m+1,n+1);
    for j=1:2:(n+2)
        J = (j-1)/2;
        A(:,j) = cos(J*t);
    end
    for j=2:2:(n+2)
        J = (j-2)/2;
        A(:,j) = sin(J*t);
    end 

    coeffs = A\b; %tried using (transpose(A)*A)\(transpose(A)*b) but said the matrix was singular
    
    %Plot computed solution against data values(b)
    t_p = 1 : (pi - 1)/100 : pi;
    y_calc = zeros(size(t_p));

    for i = 1:2:length(coeffs)
        I = (i-1)/2;
        y_calc = y_calc + coeffs(i)*cos(I*t_p);
    end
    for i = 2:2:length(coeffs)
        I = (i-2)/2;
        y_calc = y_calc + coeffs(i)*sin(I*t_p);
    end

    figure
    hold on
    plot(t_p,y_calc)
    scatter(t,transpose(b))
    xlabel('t')
    ylabel('y(t)')
    title({'Trigonometric least squares approximation of y';['(n = ', num2str(n), ' and \epsilon = ', num2str(Eps),')']})
    legend('approximation','true solution')
end

end