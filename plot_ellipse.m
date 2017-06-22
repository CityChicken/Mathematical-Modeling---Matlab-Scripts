
function plot_ellipse(m,C, Delta_squared)
    N = 1000;
    theta = linspace(0,2*pi,N)';
    xhat = [cos(theta), sin(theta)];
    r = zeros(N,2);
    for i=1:N
        r(i,:) = sqrt(Delta_squared/(xhat(i,:)*inv(C)*xhat(i,:)'))*xhat(i,:);
    end
    plot(m(1)+r(:,1), m(2)+r(:,2), 'LineWidth', 2)
    
end