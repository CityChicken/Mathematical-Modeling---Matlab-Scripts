%% CGLS - Conjugate Gradient Least Squares
clear all
% data
N=211;
M=211;

delta_t = 0.5;
t=-5:delta_t:100;

T0 = 10;
g0 = T0*exp(-1);
G = zeros(M-1,N-1);

for i=1:M-1
    for j=1:N-1
        if t(i+1)>t(j)
            G(i,j) = (t(i+1)-t(j))*exp(-(t(i+1)-t(j))/T0);
        end
    end
end

G = G./max(G(:))*delta_t;
[U,S,V]=svd(G);
 
sigma = 2;
m_true = (exp(-(t(1:N-1)-8).^2./(2*sigma^2))+0.5*exp(-(t(1:N-1)-25).^2./(2*sigma^2)))';
size(G);
size(m_true);
d_true = G*m_true;

sigma_n = 0.05;
d_noisy = d_true+(sigma_n)*randn(size(d_true)); 


% CGLS Constants
k = 1;  %k = 0;
m(:,1) = zeros(N-1,1); %m0
P(:,1) = zeros(length(d_noisy),1); %p_-1
B(1) = 0; % B_-1
s(:,1) = -d_noisy;
r(:,1) = G'*s(:,1);


% CGLS loop
mprev = m(:,1);
mnext = ones(1,N-1)';
while max(abs(mprev - mnext))> 10^-5
    % k = k+1 for matlab implementation k-1 = k
    mprev = mnext;
       
    P(:,k+1) = -r(:,k) + B(k).*P(:,k);
    A(k) = (r(:,k)'*r(:,k))/ ((P(:,k+1)'*G')*(G*P(:,k+1)));
    m(:,k+1) = m(:,k) + A(k).*P(:,k+1);
    s(:,k+1) = s(:,k) + A(k).*G*P(:,k+1);
    r(:,k+1) = G'*s(:,k+1);
    B(k+1) = r(:,k+1)'*r(:,k+1) / (r(:,k)'*r(:,k));
    
    mnext = m(:,k+1);
    
    k = k+1;
    if k>1000
        break;
    end
end
disp(m(:,k))

plot(t(2:end),d_true,t(2:end),G*m(:,k))

plot(1:length(m_true), m_true, 1:length(m_true), m(:,k))
