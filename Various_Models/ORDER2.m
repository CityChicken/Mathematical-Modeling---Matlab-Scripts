X(1) = 1;
Y(1) = 0;
P(1)= 0;
Q(1) = 0;
dt = 0.05;
i = 2;
epsi = 0.05;
T = 7/epsi;
for n = dt:dt:T,
    X(i) = X(i-1) + P(i-1)*dt;
    Y(i) = Y(i-1) + Q(i-1)*dt;
    P(i) = P(i-1) + (-X(i-1) + epsi*Y(i-1))*dt;
    Q(i) = Q(i-1) + (epsi*X(i-1) - Y(i-1))*dt;
    i=i+1;
end
N=0:dt:T;
plot(N,(X+Y)/2);
hold on
%%plot(N,Y);
xlabel('t');
ylabel('X1,X2');
title('Plot of Values using, dt = 0.05 , epsilon = 0.05, and T = 7/epsilon'); 
    

