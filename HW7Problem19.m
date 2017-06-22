function b = HW7Problem19
T = @(t) t.^-1.*cos(t.^-1.*log(t));
b = 0;
j = 1;
q = 0;
for k = 1:1000000
    b1 = b;
    q1 = q;
    r1 = fzerotx(@(t) log(t)/t + (j+1/2)*pi,[0,1]);
    if k==1
        r2 = 1;
    else
        r2 = fzerotx(@(t) log(t)/t + (j-1/2)*pi,[0,1]);
    end
   
     r3 = fzerotx(@(t) log(t)/t + (j+3/2)*pi,[0,1]);
     r4 = fzerotx(@(t) log(t)/t + (j+5/2)*pi,[0,1]);
     p1 = quad(T,r1,r2);
     p2 = quad(T,r3,r1);
     p3 = quad(T,r4,r3);
    b = b + quad(T,r1,r2);
    q = q + p2 - (p3-p2)^2/(p3 - 2*p2+ p1);
    if abs(q1-q)<10^-5
        break
    end
    j = j+3;
end
Iterations = (j-1)/3 +1
