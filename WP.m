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
%hist(Brownian(1:N));
%hold on
%P1 = plot(x,Num(1,:)); 
%P2 = plot(x,Num(2,:)); 
%title('Simulated Wiener Process')
%ylabel('W(t)')
%xlabel('Time')

figure
x = 2*dt;
subplot(2,3,1)
plot(0:dt:x, Num(2:4))
title('2 Steps')
x = 5*dt;
subplot(2,3,2)
plot(0:dt:x, Num(2:7))
title('5 Steps')
x = 10*dt;
subplot(2,3,3)
plot(0:dt:x, Num(2:12))
title('10 Steps')
x = 50*dt;
subplot(2,3,4)
plot(0:dt:x, Num(2:52))
title('50 Steps')
x = 100*dt;
subplot(2,3,5)
plot(0:dt:x, Num(2:102))
title('100 Steps')
subplot(2,3,6)
plot(0:dt:T, Num(1,:))
title('Up to T=10')

