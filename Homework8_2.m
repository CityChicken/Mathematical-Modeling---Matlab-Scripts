%% ABT_Section_11_3

% Laura Smith
% Math 503 AB 
% Class Assignment

%% Shaw Problem - Setup


M=20;
N=20;

% Simulated true
m_true = zeros(N,1);
m_true(10) = 1;

% s and theta definitions
s = ((1:M)-0.5)*pi/M-pi/2;
theta = ((1:N)-0.5)*pi/N-pi/2;

delta_theta = pi/N;

% G matrix
G = zeros(M,N);

for i=1:M
    for j=1:N
        if sin(s(i))+sin(theta(j)) == 0
            G(i,j) = (cos(s(i))+cos(theta(j)))^2*delta_theta;
        else
            G(i,j) = (cos(s(i))+cos(theta(j)))^2*((sin(pi*(sin(s(i))+sin(theta(j)))))/(pi*(sin(s(i))+sin(theta(j)))))^2*delta_theta;
        end
    end
end

d_noise = G*m_true+randn(N,1)*1.0e-6;


%% Bayesian Method - Relatively Uniformative/More Restrictive MVN Prior

for priorMethod = 1:2

    if priorMethod==1

        % Uninformative Prior
        m_prior = 0.5*ones(N,1);    
        C_M = 0.25*eye(N);
        C_D = 1.0e-12*eye(M);

    elseif priorMethod == 2

        % More Restrictive Prior
        m_prior = zeros(N,1);
        m_prior(6:14)=0.5*(1 - cos(2*pi*(1:9)'/(10)));
        C_M=50*diag(0.00125*ones(N,1).*(0.5*(1 - cos(2*pi*(1:N)/(N+1))))'.^2); 
        C_D = 1.0e-12*eye(M);

    end


% Find the MAP Solution
m_MAP = [inv(sqrtm(C_D))*G;  inv(sqrtm(C_M))]\[inv(sqrtm(C_D))*d_noise;  inv(sqrtm(C_M))*m_prior]
m_MAP2 = [sqrtm(inv(C_D))*G;  sqrtm(inv(C_M))]\[sqrtm(inv(C_D))*d_noise;  sqrtm(inv(C_M))*m_prior]

% Find the Covariance matrix of MAP solution
Cmp = inv(G'*inv(C_D)*G+inv(C_M));


% Plot the MAP solution with 95% probability intervals
figure(2*priorMethod-1)
plot(theta, G*m_MAP, theta, G*m_true)
legend('Gm_{MAP}', 'Gm_{true}')
if priorMethod == 1;
    title('Solution Estimation vs True - Uninformative Prior')
else
    title('Solution Estimation vs True - More Restrictive Prior')
end
figure(2*priorMethod)

M_ALL = [m_MAP m_true (m_MAP + 1.96*diag(Cmp).^0.5) (m_MAP - 1.96*diag(Cmp).^0.5)]
stairs(M_ALL)
%plot(1:20, m_MAP, 1:20, m_true, 1:20, (m_MAP + 1.96*diag(Cmp).^0.5) ,1:20, m_MAP - 1.96*diag(Cmp).^0.5 )
legend('m_{MAP}','m_{true}','m_{95+}','m_{95-}')
if priorMethod == 1;
    title('Parameter Estimation vs True - Uninformative Prior')
else
    title('Parameter Estimation vs True - More Restrictive Prior')
end

end