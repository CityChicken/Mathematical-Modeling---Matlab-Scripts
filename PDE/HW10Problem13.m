function b = HW10Problem13
x = linspace(0,1,20);
t = [0 0.5 1 1.5 2]; 
sol = pdepe(0,@PDE,@INITIAL,@BOUNDARY,x,t);
surf(x,t,sol)



function [c,f,s] = PDE(x,t,u,DuDx)
c = pi^2;
f = DuDx;
s = 0;
end


function u0 = INITIAL(x)
u0 = sin(pi*x);
end


function [pl,ql,pr,qr] = BOUNDARY(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = pi * exp(-t);
qr = 1;
end

end