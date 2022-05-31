clc
clear all
close all

tic
Img= imread('build.jpg');      % readig the image
imshow(Img);
title('Original Image');

I= double(Img);
I1= 255-I ;     % operation to make negetive image 

I1= uint8(I1);
figure,
imshow(I1);
title('Negetive Image');

I2= I*255;    % multiply by 255
I2= sqrt(I2);       % taking squart root
I2= uint8(I2);
figure,
imshow(I2);
title('Fair Image');
imwrite(I2,'me5.jpg');

toc
