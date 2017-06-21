sigma=.2;
S0=80; 
r=.04;D=0;
T=10; 
KP=100; 
dt =1/50; 
N=T/dt;   
x = 0:dt:T;
Brownian = sqrt(dt)*randn(2,N);
Num = zeros(2,N+1);
for t = 2:N+1
Num(1,t) = Num(1,t-1)+Brownian(1,t-1);
Num(2,t) = Num(2,t-1)+Brownian(2,t-1);
end 
hold on
P1 = plot(x,Num(1,:)); 
P2 = plot(x,Num(2,:)); 
ylabel('W(t)')
xlabel('Time')