%%%HW10Problem 10%%%%
%uxx + uyy = 0

 h = pi/100;
  n = round(1/h)+1;
  h = 1/(n-1);
 u = zeros(n,n);
 u(:,1 )= sin(pi*(0:h:1));
 u(n,n) = 0;
 J = 2:n-1;
 K = 2:n-1;
 utemp = zeros(n);
 counter = 0;
 while max(max(abs(u-utemp)))> eps
     utemp = u;
     u(J,K) = .25*(u(J+1,K)+u(J-1,K)+u(J,K+1)+u(J,K-1));
     counter = counter+1;
 end
U = u ;
Iterations  = counter
[X,Y] = meshgrid(0:h:1,0:h:1);
%mesh(X,Y,u)
figure(1)
surf(X,Y,u) 

figure(2)

direction = [0 -1 30];
rotate(surf(X,Y,u) ,direction,60)