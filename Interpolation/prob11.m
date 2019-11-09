function maxerror = prob11(n)
if nargin == 0
    n = 2;
end
k = 1:11;
t(k) = (k-1)/10;
y(k) = erf(t(k));
b = polyfit(t,y,n);
F = @(x) polyval(b,x);
t = 0:.01:1;
Y = F(t);  
plot(t,Y,'r', t, erf(t),'b')
legend1 = sprintf('ployfit degree %d',n);
legend(legend1,'erf(t)')
maxerror = max(Y-erf(t));