function b = HW9Problem19(p,v0)
%%%%%HW 9 - Problem 19%%%%%
g = 9.81; %% Gravity in m/s^2
c = 0.72; %% Drag Coefficient 
s = 0.50; %% Cross-Sectional Area in m^2
m = 80;   %% Mass in KG
theta = pi/8; %% Initial Angle in radians

if nargin == 0
v0 = 10.0; %% Initial velocity
p = 1.29; %% Air density in kg/m^3
end

D = @(X,Y) c*p*s*(X^2+Y^2)/2;
F = @(t,y) [y(4)*cos(y(3)); y(4)*sin(y(3)) ; -g/y(4)*cos(y(3)); 
    -D(y(4)*cos(y(3)),y(4)*sin(y(3)))/m-g*sin(y(3))];
Options = odeset('Events', @myEvent, 'Reltol', eps);

y0 = [0 0 theta v0]; 
[tt,yy] = ode45(F,[0 10], y0, Options)

plot(tt,yy(:,2))
b = max(yy(:,1));

function [position,isterminal,direction] = myEvent(~,y)
position = y(2); % The value that we want to be zero
isterminal = 1;  % Halt integration 
direction = 0;   % The zero can be approached from either direction
end
 
end