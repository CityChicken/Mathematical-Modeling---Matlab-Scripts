%%HW5 Problem 1
function z = Homework5
xobs = [6.0 10.1333 14.2667 18.4 22.5333 26.6667]'
tobs = [3.4935 4.285 5.1374 5.8181 6.8632 8.8141]'
m = length(xobs);
%model t_i = t_o + s_2*x_i
f = @(m) m(1) + m(2)*xobs;
sig = 0.1;
%errors are norm distributed with mu = 0 and sig = 0.1
G = [ones(length(xobs),1) xobs];


%% A) Least Squares  (G'Gm = G'tobs)
m_ols = (G'*G)\(G'*tobs)

%%Plot sol vs values
figure(1)
plot(xobs, tobs, 'o' , xobs, f(m_ols))
title('Ordinary Least Squares')
xlabel('x_{obs} ')
ylabel('t_{obs}')
%% B) Correlation matrix

Cov_Ml2 = sig^2.*inv(G'*G)

%% C)Conf Intervals and Plot 95% conf ellipsoid
n = length(m_ols);
alpha = 0.05;

%Conf interval plot
Conf_int = [(m_ols - 1.96*sqrt(diag(Cov_Ml2))) (m_ols + 1.96*sqrt(diag(Cov_Ml2)))]

%0.95 prob of being within [0,b] of chi square dist.
delta2 = chi2inv(1-alpha,m-n)

%Plot
figure(2)
plot_ellipse(m_ols,Cov_Ml2, delta2);
title('95% Confidence Elipse')
xlabel('s2 vals')
ylabel('t0 vals')

%% D)Chi Squared(X2) and p-value calculation
X2 = sum((tobs - G*m_ols).^2)/sig^2
p = 1-chi2cdf(X2,m-n)

%% E) MC Error prop for X2 distribution values
Trials = 1000;
X2vec = zeros(1000,1);

%Iterate though noise creation and X2 calculation.
for i = 1:1000
 tobs1 = G*m_ols + 0.1*randn(length(tobs),1);
 X2vec(i) = sum((tobs1 - G*m_ols).^2)/sig^2;

end
sort(X2vec);

%Plot of Histogram vs. Actual Distribution
figure(3)
subplot(2,1,1)
hist(X2vec, 20);
xlabel('Chi Squared Stat Value')
ylabel('# of Occurences')
title('Distribution of X^2 Over 1000 Simuations')
subplot(2,1,2)
plot(0:0.5:25,chi2pdf(0:0.5:25,m-n)*1000);
xlabel('Chi Squared Stat Value')
ylabel('Probability (from PDF) * 1000')
title('Chi Square Distribution with M-N degrees of freedom')



%% F) Computer proportion of X2 above X2ob. Compare to P
ptest = sum(X2vec>=X2)/1000

%% G) IRLS 
%Call N1Regress Function defined at bottom
m_1norm = N1Regress(G,0)

%Plot Fit
figure(4)
plot(xobs, tobs, 'o' , xobs,G*m_1norm)
title('1norm Regression')
xlabel('x_{obs} ')
ylabel('t_{obs}')

%% H) MC error prop and IRLS 
for i = 1:1000
    T(i,:) = N1Regress(G,sig)';
end
Mbar(1) = mean(T(:,1));
Mbar(2) = mean(T(:,2));

for i = 1:1000
    A(i,:) = T(i,:) - Mbar;
end
M = sort(T);
i = 1:1000;

%Covariance Matrix and Confidence Intervals for IRLS 1-Norm
COV = (A'*A)./Trials
MU = m_1norm + sig*diag(COV).^(1/2);
ML = m_1norm - sig*diag(COV).^(1/2);
Mconf = [ML MU]

%% I) Q-Q plots
figure(5)
plot(M(:,1),norminv((i-0.5)./Trials))
title('Q-Q polt: Normal Values vs. t0 Values')

figure(6)
plot(M(:,2),norminv((i-0.5)./Trials))
title('Q-Q polt: Normal Values vs. S2 Values')

%%Iterative Lease Squares Using 1-Norm
function b = N1Regress(G,eta)
tobs = [3.4935 4.285 5.1374 5.8181 6.8632 8.8141]';
tobs = tobs + eta*randn(length(tobs),1);

m_ols = (G'*G)\(G'*tobs);
m_guess = zeros(length(m_ols),1);
m_1norm = m_ols;
k = 0;
while max(abs(m_1norm - m_guess))> 10^-8
   k = k+1;
   m_guess = m_1norm;
   D = (abs(tobs - G*m_guess));
    for i = 1:length(D)
        if D(i)<10^-8
            D(i) = (10^-8);
        end
    end
    R = diag(1./D);
    m_1norm = inv(G'*R*G)*G'*R*tobs;
   if k>200
    break
   end
end
b = m_1norm;


