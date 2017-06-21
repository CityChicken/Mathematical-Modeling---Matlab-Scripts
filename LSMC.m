% ========================
% Parameters of American Options
% ========================
% Stock
sigma=.2; % Volatility
S0=85; % Initial price
% Interest rate and Dividend Yield
r=.04;
D=0;
% Options
T=1; % Time to Maturity
KP=100; % Strike Price
% ===================
% Monte Carlo Simulations
% ===================
dt =1/50; %Lenght of the interval of time
N=T/dt; %Number of periods to simulate the price of the stock
NSim=10000; %Munber of simulations
dBt=sqrt(dt)*randn(NSim,N); % Brownian motion
St=zeros(NSim,N); % Initialize matrix
St(:,1)=S0*ones(NSim,1); % vector of initial stock price per simulation
for t=2:N;
St(:,t)=St(:,t-1).*exp((r-D-.5*sigma^2)*dt+sigma*dBt(:,t)); %simulation of prices
end
SSit=St; % just change the name
NSim=size(SSit,1); % Number of simulations
%================================
% Computing the value of American Options
%================================
% Work Backwards
% Initialize CashFlow Matrix
MM=NaN*ones(NSim,N);
MM(:,N)=max(KP-SSit(:,N),0);
Counter = 0;
for tt= N:-1:3 ;
% disp('Time to Maturity')
% disp(1-tt/N)
% Step 1: Select the path in the money at time tt-1
I=find(KP-SSit(:,tt-1)>0);
ISize=length(I);
% Step 2: Project CashFlow at time tt onto basis function at time tt-1
if tt==N
YY=(ones(ISize,1)*exp(-r*[1:N-tt+1]*dt)).*MM(I,tt:N);
else
YY=sum(((ones(ISize,1)*exp(-r*[1:N-tt+1]*dt)).*MM(I,tt:N))')';
end
SSb=SSit(I,tt-1); 
XX=[ones(ISize,1),2*SSb,4*SSb.^2 - 2, (8*SSb.^3 - 12*SSb)];
BB=inv(XX'*XX)*XX'*YY;
SSb2=SSit(:,tt-1);
XX2=[ones(NSim,1),2*SSb2,4*SSb2.^2 - 2, (8*SSb2.^3 - 12*SSb2)];

% Find when the option is exercised:

IStop=find(KP-SSit(:,tt-1)>=max(XX2*BB,0));

% Find when the option is not exercised:
ICon = zeros(1,10000) ;
num = 1;
for i = 1:NSim
    if (~any(IStop == i))  
        ICon(1,num)=i;
        num = num+1;
    end
end
ICon(ICon==0) = [];
Counter = Counter + 1

% Replace the payoff function with the value of the option (zeros when
% not exercised and values when exercised):
TEST2 = length(IStop);
if (length(IStop)~=0)
  MM(IStop,tt-1)=KP-SSit(IStop,tt-1);
  MM(IStop,tt:N)=zeros(length(IStop),N-tt+1);
end
if (length(ICon)~=0)
  MM(ICon,tt-1)=zeros(length(ICon),1);
end

TEST3 = MM;

end
YY=sum(((ones(NSim,1)*exp(-r*[1:N-1]*dt)).*MM(:,2:N))')';
Value=mean(YY)
sterr=std(YY)/sqrt(NSim)