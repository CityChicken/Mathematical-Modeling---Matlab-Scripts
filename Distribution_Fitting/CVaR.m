function b = CVaR(data, P)
F = @(x) VaR(data,x);
b = integral(F, 0, P)/P;
