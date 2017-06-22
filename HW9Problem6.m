%%%%HW 9- Problem 6%%%%%
F = @(t,y)  -1000*(y-sin(t))+cos(t);
y0 = 1;
syms y(x); 
SOL = dsolve('Dy = -1000*(y-sin(t))+cos(t)', 't')
Options  = odeset('Refine', 1 , 'Stats', 'on', 'Reltol', 10^(-5));
Options  = odeset('Stats', 'on');
[tt,yy] = ode23(F, [0 1], y0, Options);
[tt1,yy1] = ode23s(F, [0 1], y0, Options);

plot(tt,yy, '.', tt1,yy1, 'o')