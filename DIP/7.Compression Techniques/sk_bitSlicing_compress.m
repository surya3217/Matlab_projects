clc
clear all
close all

% Bit slicing compression removing LSB bit 
% Suraj Kumar Saini
% 2015KUEC2015

H= imread('lena.jpg');      % read the image
% imshow(H);
H= rgb2gray(H);
subplot(1,2,1)
imshow(H);      title('Original Image')
I= H(:);

for i=1:numel(I)           %  removing LSB from the image
    if rem(I(i),2)==1
        I(i)= I(i)-1 ;       
    end
end

I= reshape(I,size(H));
I= uint8(I);
subplot(1,2,2)
imshow(I);           title('Compressed Image')


