%%%%%%%HW9 - Problem 20%%%%%%%%
g = 981;
L = 30;
%ddY = -g/L*Y;
F = @(t,y) [y(2); -g/L*y(1)];
%%syms y(x); dsolve('D2y = -(g/L)*y', 'x')
z = 1;
k = 0;
for i = 0:0.01:0.9999*pi
    S = @(t) 1./sqrt((1-sin(k/2)^2*t.^2).*(1-t.^2));
    T(z) = 4*(L/g)^(1/2)*quad(S,0,1);
    z = z+1;
    k = k+0.01;
end
alpha = 0:0.01:0.9999*pi; 
m = sin(alpha./2).^2;
T2 = 4*(L/g)^(0.5)*ellipke(m);

ApproxPeriod = sqrt(L/g)*2*pi
Period  = T(1:10)
figure(1)
plot(alpha,T, 'r',alpha,T2, 'b')
 Error = T2-T;
figure(2)
hold on
T2 = 4*(L/g)^(0.5)*ellipke(sin(0.05/2).^2);
[tt,yy] = ode23s(F,[0 T2],[0.05 0]); 
plot(yy(:,1),yy(:,2))

T2 = 4*(L/g)^(0.5)*ellipke(sin(0.1/2).^2);
[tt,yy] = ode23s(F,[0 T2],[0.1 0]); 
plot(yy(:,1),yy(:,2))

T2 = 4*(L/g)^(0.5)*ellipke(sin(0.15/2).^2);
[tt,yy] = ode23s(F,[0 T2],[0.15 0]); 
plot(yy(:,1),yy(:,2))

T2 = 4*(L/g)^(0.5)*ellipke(sin(0.90*pi/2).^2);
[tt,yy] = ode23s(F,[0 T2],[0.90 0]); 
plot(yy(:,1),yy(:,2))

T2 = 4*(L/g)^(0.5)*ellipke(sin(0.95*pi/2).^2);
[tt,yy] = ode23s(F,[0 T2],[0.95*pi 0]); 
plot(yy(:,1),yy(:,2))