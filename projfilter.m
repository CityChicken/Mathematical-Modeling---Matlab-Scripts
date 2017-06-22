% The code below takes a matrix of projections and returns
% a matrix with filtered projections whose Fourier Transform
% is |w|.  By uncommenting the vairous filters, various aspects
% of the reconstructed picture will be emphasized or lost.

function [FIL, Pads] = projfilter(Image)
P = nextpow2(length(Image(:,1)));
Pads = floor(0.5*(2.^P)-0.5*length(Image(:,1)));
Image = padarray(Image,floor(0.5*(2.^P)-0.5*length(Image(:,1))));

[L,C]=size(Image);

% - - - - - - Filters - - - - - - - -

%  Uncomment the different filters below to change which one is
%  applied to the projections we calculate in proj.m

w = [-pi : (2*pi)/L : pi-(2*pi)/L];

%Ramp filter (Linear High-Pass filter)
Filt = fftshift(abs(w));

% The opposite of the Ramp Function (Linear Low-Pass Filter)
%Filt = (abs(w));

% IIR Filter 
%a=[1,-.9];
%b=[1];

% FIR-Box car-length 32
%a=1;
%b=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% Butterworth Filter (Low-Pass Filter)
%fcutoff = 1000; 
%Filt=3*10^5*((1+.414.*(fcutoff./(abs(w))).^2).^-1);

%Cosine Filter (peak at 25)
%Filt = abs(cos(w));

% % Stretched Sinusoidal Filter (peak at 42)
% w = [-pi : (2*pi)/L : pi-(2*pi)/L];
% Filt = abs(sin(w));
% % Filt = Filt .* 3.5;

% - - - - - - - - - - - - - - - - -

% Below we use the Fourier Slice Theorem to filter the image
for i = 1:C,
    IMG = fft(Image(:,i));
    FiltIMG = IMG.*Filt';
    %FiltIMG = filter (b, a, IMG);
    FIL(:,i) = ifft(FiltIMG);
end
% Remove any remaining imaginary parts
FIL = real(FIL);


