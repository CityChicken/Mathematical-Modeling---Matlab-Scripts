T = 50;
R = 400;
r_0 = 102;
f_0 = 198;
alpha = 0.01;
Rab(1) = r_0;
Fox(1) = f_0;
n = 5000;
h = T/n;
E1 = r_0;
E2 = f_0;

D2 = @(t,y) [2*(1-y(1)/R)*y(1) - alpha*y(1)*y(2); -y(2) + alpha*y(1)*y(2)];
D = @(t,y) [2*y(1) - alpha*y(1)*y(2); -y(2) + alpha*y(1)*y(2)];
options = odeset('relTol', eps);
[t, Y] = ode23s(D,[0 T], [r_0,f_0],options);
[t1, Y1] = ode23s(D2,[0 T], [r_0,f_0],options);

figure(1)
plot(t,Y(:,1),'b', t ,Y(:,2), 'r') 
title('Rabits and Foxes v. Time - Latka-Volterra')
xlabel('Time') % x-axis label
ylabel('# of animals') % y-axis label
legend('y = Rabbits','y = Foxes')

figure(2)
plot(Y(:,1),Y(:,2))
title('Foxes v. Rabbits - Latka-Volterra')
xlabel('Rabbits') % x-axis label
ylabel('Foxes') % y-axis label

figure(3)
plot(t1,Y1(:,1),'b', t1 ,Y1(:,2), 'r') 
title('Rabits and Foxes v. Time - Latka-Volterra Modified')
xlabel('Time') % x-axis label
ylabel('# of animals') % y-axis label
legend('y = Rabbits','y = Foxes')

figure(4)
plot(Y1(:,1),Y1(:,2))
title('Foxes v. Rabbits - Latka-Volterra Modified')
xlabel('Rabbits') % x-axis label
ylabel('Foxes') % y-axis label
