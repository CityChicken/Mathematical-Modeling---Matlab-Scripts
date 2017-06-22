
% decodefile.m
%
% Decodes the Interfile format into a [128, 180] matrix.  Each of the 180 
% columns is a different projection vector.  
%
% y = decodefile(file, n)
%
%     Where n is the row of the image you want and file is the string of the
%     file name.
%
% by Stephen K. Gee
%
function y = decodefile(file, n)

fid = fopen(file);            % Opens File
r = 128*2*n;

for i = 0:179
        fseek(fid, r+i*128*128*2, -1);      % Sets to proper row of image
        x = fread(fid, 128, 'uint16');      % reads image data
        y(i+1,:) = x';
end