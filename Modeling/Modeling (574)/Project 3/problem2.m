clear
close all

A1 = getA(1);
A2 = getA(2);
eig1 = eig(A1);
eig2 = eig(A2);

first = real(eig1);
pos1 = find(first>0);

second = real(eig2);
pos2 = find(second>0);

function A = getA(RHS)
rho = 2.7*10^3; Y = 7*10^(10); C = 10^(3); A = 10^(-4);
k_l = 10^7; c_l = 10^3; m_l = 10^(-3); l = 1/10;

N = 2^6; % can change
h = l/N;

M = diag(2/3*ones(1,N)) + diag(1/6*ones(1,N-1),1) + diag(1/6*ones(1,N-1),-1);

temp = diag(2*ones(1,N)) + diag(-1*ones(1,N-1),1) + diag(-1*ones(1,N-1),-1);
Q = temp;
K = temp;

if RHS == 1
    M(N,N) = 1/3 + m_l/h;
    Q(N,N) = 1 + h*c_l;
    K(N,N) = 1 + h*k_l;
elseif RHS == 2
    M(N,N) = 1/3 - m_l/h;
    Q(N,N) = 1 - h*c_l; 
    K(N,N) = 1 - h*k_l;
else
    error('RHS must be 1 or 2.')
end

M = M * rho*A*h;

Q = Q * C*A/h;

K = K * Y*A/h;

A = [zeros(N), eye(N); -M\K, -M\Q];
end
