clc 
close all 
clear all 

% Sobel Operator for edge detection
% Suraj Kumar Saini
% 2015KUEC2015

tic ;
x = imread('Bikegray.jpg') ;    % size is : x*y
% x = rgb2gray(x);        
imshow(x);
x= double(x);

gx= [1 2 1; 0 0 0; -1 -2 -1] ;    % 180 degree roration of robert matrix for x mask
gy= [1 0 -1; 2 0 -2; 1 0 -1] ;    % for y mask

a1= conv2(x,gx);      % size is : x+1*y+1
a2= conv2(x,gy);      % size is : x+1*y+1

for i=1: numel(a1)
    I(i) = sqrt(a1(i)^2 + a2(i)^2 );

end
I;
I= reshape(I,size(a1));
I= uint8(I);
figure,
imshow(I);
imwrite(I,'Sobel_imag.jpg');

% diagonally
gx= [0 -1 -2; 1 0 -1; 2 1 0] ;    % 180 degree roration of robert matrix for x mask
gy= [0 1 2; -1 0 1; -2 -1 0] ;    % for y mask

a1= conv2(x,gx);      % size is : x+1*y+1
a2= conv2(x,gy);      % size is : x+1*y+1

for i=1: numel(a1)
    I(i) = sqrt(a1(i)^2 + a2(i)^2 );

end
I;
I= reshape(I,size(a1));
I= uint8(I);

figure,
imshow(I);
imwrite(I,'Sobel2_diagonal.jpg');
toc;
