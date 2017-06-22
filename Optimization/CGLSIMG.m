%% CGLS - Conjugate Gradient Least Squares
clear all
% data
load blurry_image_128by128.mat
load blurG.mat
d = d_vect
[M N] = size(G);

% CGLS Constants
k = 1;  %k = 0;
m(:,1) = zeros(N,1); %m0
P(:,1) = zeros(length(d),1); %p_-1
B(1) = 0; % B_-1
s(:,1) = -d;
r(:,1) = G'*s(:,1);


% CGLS loop
mprev = m(:,1);
mnext = ones(1,N)';
while max(abs(mprev - mnext))> 10^-10
    % k = k+1 for matlab implementation k-1 = k
    mprev = mnext;
       
    P(:,k+1) = -r(:,k) + B(k).*P(:,k);
    A(k) = (r(:,k)'*r(:,k))/ ((P(:,k+1)'*G')*(G*P(:,k+1)));
    m(:,k+1) = m(:,k) + A(k).*P(:,k+1);
    s(:,k+1) = s(:,k) + A(k).*G*P(:,k+1);
    r(:,k+1) = G'*s(:,k+1);
    B(k+1) = r(:,k+1)'*r(:,k+1) / (r(:,k)'*r(:,k));
    
    mnext = m(:,k+1);
    
    k = k+1;
    if k>1000
        break;
    end
end
disp(m(:,k));

disp(reshape(d,[64 64]))

figure(1)
imagesc(reshape(d,[64 64]))
colormap(gray)

figure(3)
imagesc(reshape(m(:,k),[64 64]))
colormap(gray)
