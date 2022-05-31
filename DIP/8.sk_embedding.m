clc
clear all
close all

tic
% Program of Embedding the image using Bit slicing 
% Suraj Kumar Saini
% 2015KUEC2015

lena= imread('lena.jpg');   % read an image
lena= rgb2gray(lena) ;
% lena= a;
figure, imshow(lena)   
a= double(lena);

% find max no. in matrix
b= max(a(:));
bits_num= ceil(log(b)/log(2))      % no. in binary      
t= bits_num;
n= numel(a);
A= transpose(a);
 
% representing no. in binary
m = zeros(n,bits_num);
for j=1: n
    for k=1: bits_num
        if (A(j)>=2)
           m(j,k)= rem(A(j),2);     
           A(j)= fix(A(j)/2) ;
        else
            m(j,k)= fix(A(j));
            break;
      end
    end
end

m;
k = fliplr(m);
figure,
p= n;  j=1;

% plotting of slicing bit image
w= 512;

i= 1;
    b1= k(j:n*i);     
    b1= transpose(reshape(b1,[size(a)]));     % 1st bit matrix
    subplot(3,3,i);    imshow(b1,[0,1])
    j= j +p;
    b1= b1(:);             % matrix with n*1 order

i=2;
    b2= k(j:n*i);     
    b2= transpose(reshape(b2,[w,w]));     % 2nd bit matrix
    subplot(3,3,i);    imshow(b2)
    j= j +p;
    b2= b2(:);           % matrix with n*1 order
    
 i=3;
    b3= k(j:n*i);     
    b3= transpose(reshape(b3,[w,w]));      % 3rd bit matrix
    subplot(3,3,i);    imshow(b3)
    j= j +p;
    b3= b3(:);           % matrix with n*1 order

 i=4;
    b4= k(j:n*i);     
    b4= transpose(reshape(b4,[w,w]));       % 4th bit matrix
    subplot(3,3,i);    imshow(b4)
    j= j +p;
    b4= b4(:);          % matrix with n*1 order
    
 i=5;
    b5= k(j:n*i);     
    b5= transpose(reshape(b5,[w,w]));       % 5th bit matrix
    subplot(3,3,i);    imshow(b5)
    j= j +p;
    b5= b5(:);          % matrix with n*1 order
    
 i=6;
    b6= k(j:n*i);     
    b6= transpose(reshape(b6,[w,w]));       % 6th bit matrix
    subplot(3,3,i);    imshow(b6)
    j= j +p;
    b6= b6(:);          % matrix with n*1 order
 
 i=7;
    b7= k(j:n*i);     
    b7= transpose(reshape(b7,[w,w]));      % 7th bit matrix
    subplot(3,3,i);    imshow(b7)
    j= j +p;
    b7= b7(:);          % matrix with n*1 order
    
 i=8;
    b8= k(j:n*i);     
    b8= transpose(reshape(b8,[w,w]));      % 8th bit matrix
    subplot(3,3,i);    imshow(b8)
    j= j +p;
    b8= b8(:);          % matrix with n*1 order
    
% plotting 
subplot(3,3,1);  title('MSB');
subplot(3,3,t);  title('LSB');

% Reconstruct the normal image 
b= [b8 b7 b6 b5 b4 b3 b2 b1];    
b= bi2de(b);
b= uint8(b);
lena1= reshape(b,[size(a)]);
subplot(2,2,1), imshow(lena1);
title('Reconstruct the normal image ');

% Reconstruct the image when LSB =0
lsb= zeros(n,1);
b= [lsb b7 b6 b5 b4 b3 b2 b1]; 
b= bi2de(b);
b= uint8(b);
lena2= reshape(b,[w,w]);
subplot(2,2,2), imshow(lena2);
title('Reconstruct image when LSB =0');

% T shape image
mark= zeros(w,w);
mark(150:200,150:400)=1;
mark(200:400,250:300)=1;
mark= uint8(mark);
subplot(2,2,3), imshow(mark,[0,1]);
title('T image');

% Construct the image with T image
mark= reshape(mark,[n,1]);
b= [mark b7 b6 b5 b4 b3 b2 b1]; 
b= bi2de(b);
b= uint8(b);
lena3= reshape(b,[w,w]);
subplot(2,2,4), imshow(lena3);
title('Reconstruct image with T image');

Matching_Normal = ssim(lena,lena1)*100    % lena and reconstruct image
Matching_LSB_0 = ssim(lena,lena2)*100      % lena and reconstruct image with LSb= 0
Matching_With_T = ssim(lena,lena3)*100    % lena and reconstruct image with T shape


% Reconstruct the associated T image from leena
lena_T= lena3(:);   
k= de2bi(lena_T,bits_num);
g= k(:,1);
T_img= reshape(g,[size(a)]);
T_img= uint8(T_img);
figure, imshow(T_img,[0,1]);

toc

