
sigma=.2;
S0=0; 
r=.04;D=0;
T=10; 
KP=100; 
dt =1/5; 
N=T/dt;   
x = 0:dt:T;
Brownian = randn(2,N);
Num = zeros(2,N+1);
for t = 2:N+1
    if (Brownian(1,t-1)>0)
        Num(1,t) = Num(1,t-1)+1;
    else
        Num(1,t) = Num(1,t-1)-1;
    end
     if (Brownian(2,t-1)>0)
        Num(2,t) = Num(2,t-1)+1;
    else
        Num(2,t) = Num(2,t-1)-1;
     end  
end

%%Num;
%Stockprice = zeros(2,N+1);
%Stockprice(:,1) = S0*ones(2,1);
%for t = 2:N+1
%   Stockprice(1,t) =Stockprice(1,1) * exp((r-sigma^2/2)+ sigma*Num(1,t));
%    Stockprice(2,t) =Stockprice(2,1) * exp((r-sigma^2/2)+sigma*Num(2,t));
%end
hold on
P1 = plot(x,Num(1,:)); 
P2 = plot(x,Num(2,:));
%P3 = plot(x,ones(1,N+1)*100); 
legend('Simulated 1-Dimensional Random Walk','','location','northwest' )
ylabel('Stock Price')
xlabel('Time')

