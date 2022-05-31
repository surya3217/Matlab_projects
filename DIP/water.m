clc
clear all
close all

i=imread('lena.jpg');
k=rgb2gray(i);
imshow(k);

j=imread('saniya.jpg');
l=rgb2gray(j);
figure,imshow(l);

n=flipud(l);
figure,imshow(n);

m=flipud(k);
m((size(m,1)-size(n,1)+1):end, (size(m,2)-size(n,2)+1):end,1:end) = n;
m=flipud(m);
figure, imshow(m);