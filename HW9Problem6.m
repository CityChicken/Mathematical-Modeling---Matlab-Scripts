%%%%%HW 9- Problem 6%%%%%
F = @(t,y)  -1000(y-sin(t))+cos(t);
y0 = 1;
syms y(x); dsolve('Dy = y + 1', 'x');
ode23(F, [0 1], y0);
ode23s(F, [0 1], y0);
ode45(F, [0 1], y0);