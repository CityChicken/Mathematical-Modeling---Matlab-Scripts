%T-distribution fitting

function [v, lambda] = Tfit(data)
returns = (data(1:end-1)-data(2:end))./data(2:end)
Mean = mean(returns)
returns = returns - Mean;
STD = std(returns)
Var = var(returns)
Kurt = kurtosis(returns)
v = 5/(Kurt-3) + 4;
lambda = 1/Var*(v/(v-2));
ValueAtRisk95 = VaR(returns, 0.05)
ValueAtRisk99 = VaR(returns, 0.01)
CVaR95 = CVaR(returns, 0.05)
CVaR99 = CVaR(returns, 0.01)
mVaR95 = modifiedVaR(returns, 0.05)
mVaR99 = modifiedVaR(returns, 0.01)


figure(1) 
histogram(returns, 'Normalization', 'pdf')
hold on
plot(sort(returns), T(v,lambda,sort(returns)), 'r')
legend('Distribution of SX5E returns - 1987 to present', ['Student''s t-dstribution with v = ' num2str(v) ' and \lambda = '  num2str(lambda)])
hold off



limit = round(length(returns)/50);
 AC = autocorr(returns, 1);
 TKurt = zeros(1,limit);
 TSkew = zeros(1,limit);
 TVol = zeros(1,limit);
for i = 1:limit
   returns = Offset(data,i);
   Returns = (returns(1:end-1)-returns(2:end))./returns(2:end);
   TKurt(i) = kurtosis(Returns);
   TSkew(i) = skewness(Returns);
   TVol(i) = std(Returns);
end
figure(2)
plot(1:limit, TKurt)
title('Term Structure of Kurtosis')
xlabel('Term of Returns')
figure(3)
plot(1:limit, TSkew)
title('Term Structure of Skew')
xlabel('Term of Returns')
figure(4)
plot(1:limit, TVol)
title('Term Structure of Volatility')
xlabel('Term of Returns')


    function b = T(v, lambda, x)
     b = gamma((v+1)/2)/gamma((v)/2)* sqrt(lambda/(v*pi))*(1+(lambda*(x).^2)/v).^(-(v+1)/2);
    end
    function b = Offset(array,n)
        b = array(1:n:end);
    end
end
