function b = HW7_3
clear all
%% TV (Total Variation) Regularization
f = @(x) floor(x);
s = linspace(0,10,200)';
d = f(s) + 0.2*randn(length(s),1);





end