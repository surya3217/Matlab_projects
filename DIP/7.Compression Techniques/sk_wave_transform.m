clc 
close all 
clear all 

% Wavelett transform, compression technique
% Suraj Kumar Saini
% 2015KUEC2015
tic ;
x = imread('lena.jpg') ;
%x = rgb2gray(x);

[a b c d] = dwt2(x,'haar');
a = uint8(a) ;
b = uint8(b) ;
c = uint8(c) ;
d = uint8(d) ;

% figure(1),  imshow(x) ;
% title('original image');

figure('Name','First level wavlet') ;
subplot(2,2,1),  imshow(a)
subplot(2,2,2),  imshow(b)
subplot(2,2,3),  imshow(c)
subplot(2,2,4),  imshow(d)

[a1 b1 c1 d1] = dwt2(a,'haar');
a1 = uint8(a1) ;
b1 = uint8(b1) ;
c1 = uint8(c1) ;
d1 = uint8(d1) ;

figure('Name','Second level wavlet')
subplot(2,2,1),  imshow(a1)
subplot(2,2,2),  imshow(b1)
subplot(2,2,3),  imshow(c1)
subplot(2,2,4),  imshow(d1)

