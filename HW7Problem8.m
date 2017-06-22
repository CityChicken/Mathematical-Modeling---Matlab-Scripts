function b = HW7Problem8(x)
T = @(t) t^(x-1)*exp(-t);
E1 = 0;
for n = 10:1000000
 b = quadtx(T,0,n,eps);
if abs(b-E1)<eps
    Iterations = n
    break
end
E1 = b;
end