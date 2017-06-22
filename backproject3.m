
%% This is a MATLAB function that takes filtered back projections without 
%% using the 'imrotate' command.  Here, we try to cut out all the loops. 
%% PR is a matrix whose columns are the projections at each angle. 
%% THETA is a row vector of the angles of the respective projections.
%%
%% Written by : Justin K. Romberg
%% Modified by: Jacob C.

function [BPI] = backproject3(PR, THETA, Xp)

% figure out how big our picture is going to be.
n = size(PR,1);
sideSize = n;

% filter the projections
[filtPR, Pads] = projfilter(PR);
%filtPR = filterplus(PR);
%filtPR = PR;
filtPR = filtPR((Pads+1):(end-Pads),:);
% convert THETA to radians
th = (pi/180)*THETA;

% set up the image
m = length(THETA); 
BPI = zeros(sideSize,sideSize);

% find the middle index of the projections
midindex = (n+1)/2;

% set up x and y matrices
x = 1:sideSize;
y = 1:sideSize;
[X,Y] = meshgrid(x,y);
xpr = X - (sideSize+1)/2;
ypr = Y - (sideSize+1)/2;

%loop over each projection
%figure
%colormap(jet)
%M = moviein(m);
Origin = floor((size(filtPR)+1)/2);
for theta = 1:m
    s = xpr*sin(th(theta))+ ypr.*cos(th(theta));
    BPI = BPI + interp1(Xp, filtPR(:,theta), s); 
end

BPI = imrotate(BPI./m,90);