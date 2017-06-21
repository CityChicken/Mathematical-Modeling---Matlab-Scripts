%%%%%HW 9 - Problem 19%%%%%
g = 9.81 %% Gravity in m/s^2
c = 0.72 %% Drag Coefficient 
p = 0.94 %% Air density inkg/m^3
s = 0.50 %% Cross-Sectional Area in m^2
m = 80   %% Mass in KG
theta =  %% Initial Angle in radians
D = @(X,Y) c*p*s/2(X^2+Y^2)
F = @(t,y) [y(4)*cos(y(3)); y(4)*sin(y(3)) ; -g/y(4)*cos(y(3);
-D(y(4)*cos(y(3)),y(4)*sin(y(3)))/m*-g*sin(y(3))]

