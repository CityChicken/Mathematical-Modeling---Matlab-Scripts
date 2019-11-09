function b = PlotVX
Va = 30;
sd = 50;
Tau = 3;
k = 1;
C = Va/(log(sd+k)-log(k))
F= @(x) C*(log(x+k) - log(k))

% C = Va/(exp(1/10*sd))
% F = @(x) C*(exp(1/10*x) - 1)

X = 0:0.1:sd


figure(1)
plot(X,F(X))
legend('V(\Delta{x}) with Va = 30, d = 50, \tau = 3')
xlabel('\Delta{X}')  
ylabel('V(\Delta{x})')
V = 20;
dx = 0:0.1:sd
G = @(x) HEAVY(Va - F(x)) * (F(x) - V)/Tau
figure(2)
plot(dx,G(dx))
legend('Safe Distance Term with Va = 30, d = 50, \tau = 3, V(t) = 20')
xlabel('\Delta{X}')
ylabel('(V(\Delta{x}) - V)/\tau')
    
    function z =  HEAVY(x)
        if x >= 0
            z = 1;
        else
            z = 0;
        end
        
    end
    
end