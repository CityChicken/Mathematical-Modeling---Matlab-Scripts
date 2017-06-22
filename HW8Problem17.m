function HW8Problem17
y0 = [600 0];
g = 9.81;
m = 80;
K1 = 1/15;
K2 = 4/15;
opts = odeset('Events',@myEventsFcn);
F = @(t,y) [y(2); -g+K1*y(2)^2/m];
[tt yy] = ode23(F,[0 5],y0,opts)

b = length(yy);
y0 = [yy(b,1) yy(b,2)];

F = @(t,y) [y(2); -g+K2*y(2)^2/m];
[tt1 yy1] = ode23(F,[5 20],y0,opts)
tt = [tt' tt1']';
yy = [yy' yy1']';
d = length(yy);
Velocity = yy(d,2)
Time  = tt(d)
for i = 1:d
    if tt(i) == 5
        ChuteTimeHeight = yy(i,1)
        break
    end
end

function [value,isterminal,direction] = myEventsFcn(t,y)
value = y(1);
isterminal = 1;
direction = 0;
end
plot(tt,yy(:,1))
end



        
