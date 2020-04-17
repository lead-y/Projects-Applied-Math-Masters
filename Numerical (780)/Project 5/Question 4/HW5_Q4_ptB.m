

%Then make the surface plot w/ delta,r on [.01,1]^2.
nincrements = 2^5;
increment = (1-0.1)/nincrements;
mesh = 0.1:increment:1;

ftildaMat = zeros(length(mesh)); %Matrix of ftilda values for given delta and r -- 
                                 % rows -- r; cols -- delta
for i = 1:length(mesh)
    for j = 1:length(mesh)
        r = mesh(i);
        delta = mesh(j);
        ftildaMat(i,j) = f_tilda(delta,r,10^(-2));
    end
end

%delta varys -> col of ftildaMat varies --> x-axis coordinate varies

figure
surf(mesh, mesh, ftildaMat)
xlabel('\delta')
ylabel('r')
zlabel('f^~ (\delta , r)')
title('Response function, f, with \gamma = 0.015')



