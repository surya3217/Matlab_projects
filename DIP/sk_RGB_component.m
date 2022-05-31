clc
clear all
close all

% R G B component of Image 
% Suraj Kumar Saini
% 2015KUEC2015

img= imread('saniya.jpg');
% figure, imshow(img), title('Original image')
figure, image(img), title('Original image')

red = img(:,:,1);       % Red channel
green = img(:,:,2);     % Green channel
blue = img(:,:,3);      % Blue channel

a = zeros(size(img, 1), size(img, 2));

red_com = cat(3, red, a, a);
green_com = cat(3, a, green, a);
blue_com = cat(3, a, a, blue); 

figure,
subplot(2,2,1);  image(red_com), title('Red component')
subplot(2,2,2);  image(green_com), title('Green component')
subplot(2,2,3);  image(blue_com), title('Blue component')
 
original_img_back = cat(3, red, green, blue);
% figure, image(original_img_back), title('Back to original image')

gray= 0.3*red+ 0.59*green + 0.11*blue;
%G= cat(3, gray, gray, gray); 
subplot(2,2,4);
imshow(gray),  title('Gray image') ;
imwrite(gray,'gray_imag.jpg');


