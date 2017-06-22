function maxerror = prob112(n)
if nargin == 0
    n = 2*(1)+1;
end
k=n;
n = 2*(n-1:-1:1)+1;
n = [n 1]
k = 1:11;
t(k) = (k-1)/10;
y(k) = erf(t(k));
b = polyfitc(t,y,n)
F = @(x) polyval(b,x);
t = 0:.01:1;
Y = F(t);  
plot(t,Y,'r', t, erf(t),'b')
legend1 = sprintf('ployfit degree %d',n);
legend(legend1,'erf(t)')
maxerror = max(Y-erf(t));