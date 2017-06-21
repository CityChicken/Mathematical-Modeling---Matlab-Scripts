%%%%%%%HW9 - Problem 20%%%%%%%%
g = 9.81
L = 2
ddY = -g/L*Y
 F = @(t,y) [y(2); -g/L*y(1)]