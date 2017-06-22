function Sinko_Streifer 
%Sinko-Striefer model
% du/dt + d/dx(g*u) = -mu*u
%t in [0,t_f]
%x in [x_0, x_1]
%g(t,x)u(t,x)|_x=x0 = R(t)
%U(0,x) = phi(x)
R(0:0.1:5);
figure(3)
plot(0:0.1:5,R(0:0.1:5))

 phi = 0;
 x0 = 0 ;
 x1 = 0.5;
 g0 = 0.185;
 mu = 1.9;
 

 
 t = linspace(0,5,200);
 x = linspace(0,0.5,200);
 [T X] = meshgrid(t,x);
 figure(4)
 mesh(T,X,U(t,x));
 xlabel('Time')
 ylabel('Space')
 zlabel('Uval')


%part c
Nx = 50;
Nt = 50;
t = linspace(0,5,Nt)
x = linspace(0,0.5,Nx)

S = U(t,x);
[r c] = size(S);
S(:,1)
for j = 1:c
    n(j) = sum(S(:,j));
    m(j) = sum((t'.*S(:,j)));
    P(j) = m(j)/n(j);
    
end
n'
m'
P'
figure(1)
plot(x,P)
figure(2)
plot(-x,log(n))
A = [ones(length(x),1) x'];
B = P'\A;
growth = B
A = [ones(length(x),1) (-x)'];
B = log(n)'\A;
death = B
SUMS = @(G) sum(sum((Y(t,x,G(1),G(2))-S).^2));
Qols = fminsearch(SUMS,[1 1])

function z = Y(t,x,G,D) 
 x0 = 0 ;
 g0 = G;
 mu = D;
for i = 1:length(t)   
     for j = 1:length(x)     
        if t(i) < (x(j)-x0)/g0
           z(i,j) = 0; 
        else
           z(i,j) =  R(t(i) + (x0 - x(j))/g0)/g0 * exp(mu/g0*(x0-x(j)));
        end
     end
 end


function z = U(t,x) 
 x0 = 0 ;
 g0 = 0.185;
 mu = 1.9;
for i = 1:length(t)   
     for j = 1:length(x)     
        if t(i) < (x(j)-x0)/g0
           z(i,j) = 0; 
        else
           z(i,j) =  R(t(i) + (x0 - x(j))/g0)/g0 * exp(mu/g0*(x0-x(j)));
        end
     end
end


function b =  R(t)
A = 15;
B = 1/A;
S = @(t) t - 2/A - B;
for i = 1:length(t)
    if t(i) < 2/A
        b(i) = 3/4 * ((A*t(i)-1) - 1/3*(A*t(i) - 1).^3+ 2/3);
    elseif t(i) < 2/A + B
        b(i) =  1;
    elseif t(i) < 4/A
        b(i) = -3/4 * ((A*S(t(i))-1) - 1/3*(A*S(t(i)) - 1).^3 - 2/3);
    else 
        b(i) = 0;
    end
end