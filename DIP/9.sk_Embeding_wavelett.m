clc 
close all 
clear all 

% Program of Embedding the image using Wavelett transform 
% Suraj Kumar Saini
% 2015KUEC2015
tic ;
% lena image
lena = imread('lena.jpg') ;
lena = rgb2gray(lena);
figure,  imshow(lena);
title('original image');
w= 512;

% wavelett transform of lena image
[a1 a2 a3 a4] = dwt2(lena,'haar');
a1 = uint8(a1) ;
a2 = uint8(a2) ;
a3 = uint8(a3) ;
a4 = uint8(a4) ;
figure('Name','First level wavlet');
subplot(2,2,1),  imshow(a1);
subplot(2,2,2),  imshow(a2);
subplot(2,2,3),  imshow(a3);
subplot(2,2,4),  imshow(a4);

% T shape image
mark= zeros(w,w);
mark(150:200, 150:400)=1;
mark(200:400, 250:300)=1;
mark= uint8(mark);
figure,  imshow(mark,[0,1]);
title('T image');

% wavelett transform of T image
[b1 b2 b3 b4] = dwt2(mark,'haar');
b1 = uint8(b1) ;
b2 = uint8(b2) ;
b3 = uint8(b3) ;
b4 = uint8(b4) ;
figure('Name','First level wavlet');
subplot(2,2,1),  imshow(b1,[0,1]);
subplot(2,2,2),  imshow(b2,[0,1]);
subplot(2,2,3),  imshow(b3,[0,1]);
subplot(2,2,4),  imshow(b4,[0,1]);

% Reconstruct the normal image
renew1= idwt2(a1,a2,a3,a4,'haar');
d = uint8(renew1) ;
figure,
subplot(1,2,1),  imshow(d);
title('Reconstruct the normal image');
% title('Reconstruct the normal image ');
Matching_Normal = ssim(lena,d)*100

% k= a1 +b1;
% renew2= idwt2(k,a2,a3,a4,'haar');
% g = uint8(renew2) ;
% figure, imshow(g);
% Matching_Normal = ssim(lena,g)*100

% lena image with T image
renew3= idwt2(a1,a2,a3,b1,'haar');
h = uint8(renew3);
subplot(1,2,2), imshow(h);
title('lena image with T image ');
Matching_Normal = ssim(lena,h)*100

% Retriving the T image
[c1 c2 c3 c4]= dwt2(h,'haar');
c1 = uint8(c1) ;
c2 = uint8(c2) ;
c3 = uint8(c3) ;
c4 = uint8(c4) ;
figure,
% title('Retriving the T image ');
subplot(2,2,1),  imshow(c1);
subplot(2,2,2),  imshow(c2);
subplot(2,2,3),  imshow(c3);
subplot(2,2,4),  imshow(c4,[0,1]);
title('Retriving the T image');
toc

