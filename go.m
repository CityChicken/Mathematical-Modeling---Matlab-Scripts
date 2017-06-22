% go.m
%
% Usage : go(IMAGE, N)
%
% IMAGE - a picture loaded into some matric in Matlab
% N - the number of projections you want taken between 0 and 180
%
% Written by : Michael Haag & Eric Wingrove

function go = go(image, N)

%  Load the image into Matlab
 disp('Loading Image into Matlab...');
 image;
 load e;

%  Plot the original image on subplot #1
 figure(4);
 colormap(flipud(gray(256)));
 subplot(311);
 imagesc(image);
 title('Original Picture');
 disp('Plotting original image...');

%  Take the Projections of the image where 'count' is the number
%  of intervals for theta between 1 and 180
 interval = linspace(1, 180, N);
 Proj = proj(image, N);
 disp('Calculating projections of the image...');
 subplot(312);
 imagesc(Proj);
 title('Sinugram - Plot of unchanged Projections');

%  Add Noise to projections
 disp('Adding noise to each projection...');
 X = randn(144);
 for i = 1:N,
     Proj(:,i)= Proj(:,i) +(2.* X(:,i));
 end
 
%   Using the projections from above we can now filter and back-project
%   the image using our backprojection algorithm
 disp('Reconstructing the image from back-projection...');
 BP = back(Proj, interval);
 subplot(313);
 BP = BP(20:120,20:120);
 imagesc(BP);
 title('Filtered Back-Projected Image');
