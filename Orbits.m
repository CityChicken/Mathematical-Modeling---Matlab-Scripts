

x = [1.02 .95 .87 .77 .67 .56 .44 .30 .16 .01]';
y = [0.39 .32 .27 .22 .18 .15 .13 .12 .13 .15]';

x1 = x + [(rand(1,10)-0.5)./10000]';
y1 = y + [(rand(1,10)-0.5)./10000]';

for i = 1:10
X(i,1) = x(i).^2 ;
X(i,2) = x(i).*y(i);
X(i,3) = y(i).^2;
X(i,4) = x(i);
X(i,5) = y(i);

Xn(i,1) = x1(i).^2 ;
Xn(i,2) = x1(i).*y1(i);
Xn(i,3) = y1(i).^2;
Xn(i,4) = x1(i);
Xn(i,5) = y1(i);
end
X = X;
z = -[1 1 1 1 1 1 1 1 1 1]';  
B = X'*X\X'*z
Bn = Xn'*Xn\Xn'*z
xmin = -0.75;
ymin = 0;
xmax = 1.2;
ymax = 1.3;
deltax = 0.01;
deltay = 0.01;
hold on
[X1,Y1] = meshgrid(xmin:deltax:xmax,ymin:deltay:ymax);
Z = B(1)*X1.^2 + B(2)*X1.*Y1 + B(3)*Y1.^2 + B(4)*X1 + B(5)*Y1 + 1;
contour(X1,Y1,Z,[0 0])

[X1,Y1] = meshgrid(xmin:deltax:xmax,ymin:deltay:ymax);
Z = Bn(1)*X1.^2 + Bn(2)*X1.*Y1 + Bn(3)*Y1.^2 + Bn(4)*X1 + Bn(5)*Y1 + 1;
contour(X1,Y1,Z,[0 0])
hold off
