function b = secant(f,a,b)
k = 0;
while abs(b-a) > eps*abs(b)
c = a;
a = b;
b = b + (b - c)/(f(c)/f(b)-1);
k = k + 1;
end