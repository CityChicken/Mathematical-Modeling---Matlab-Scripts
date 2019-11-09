clear all
counter  = 1;
for i = [64 128 256 512 1024 2048 4096];

I = phantom(i);
n = 180;
X = linspace(0,180, n);

[Z, Xp] = radon(I,X);
 
K = round((length(Xp)-i)/2);

tic
PROJECTEDIMG = backproject3(Z,X,Xp);
PROJECTEDIMG = PROJECTEDIMG(K+1:(end-K),K+1:(end-K));
time1(counter) = toc;
%PROJECTEDIMG = PROJECTEDIMG(30:160,30:160);
figure(1)
subplot(1,2,1)
imagesc(I)
subplot(1,2,2)
imagesc(PROJECTEDIMG)

%imagesc(imrotate(flip(PROJECTEDIMG),90))


Z = radon(I,X);
tic
PROJECTEDIMG = iradon(Z, X);
time2(counter) = toc;

% I = gpuArray(phantom(1028));
% tic
% Z = radon(I,X);
% PROJECTEDIMG = iradon(Z, X);
% %PROJECTEDIMG = PROJECTEDIMG(30:160,30:160);
% toc

figure(2)
subplot(1,2,1)
imagesc(I)
subplot(1,2,2)
imagesc(PROJECTEDIMG)
counter = counter + 1;
end
Ratio1= time1(2:end)./time1(1:end-1)
Ratio2 = time2(2:end)./time2(1:end-1)
figure(3)
plot([64 128 256 512 1024 2048 4096], time1,[64 128 256 512 1024 2048 4096], time2)
