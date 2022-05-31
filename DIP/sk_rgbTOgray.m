clc
clear all
close all

lena= imread('lena.jpg');
figure,imshow(a)
b= size(a)

For Each Pixel in lena 

   Red = Pixel.Red
   Green = Pixel.Green
   Blue = Pixel.Blue

   Gray = (Red + Green + Blue) / 3

   Pixel.Red = Gray
   Pixel.Green = Gray
   Pixel.Blue = Gray

   end