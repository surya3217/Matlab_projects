clc
clear all
close all

tic
% Program of Bit slicing of an image 
% Suraj Kumar Saini
% 2015KUEC2015

lena= imread('lena.jpg');     % read an image
a= rgb2gray(lena) ;
figure,   imshow(a)       
a= double(a);

% find max no. in matrix
b= max(a(:)) ;
i= ceil(log(b)/log(2))       % no. in binary      
t= i;
n= numel(a)
A= transpose(a);
 
% representing no. in binary
m = zeros(n,i);
for j=1:n
    for k=1:i
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
p= numel(k);
figure,
p= n;
j=1;

% plotting of slicing bit image
w= 512;
for i=1:t
    b1= k(j:n*i);       
    b1= transpose(reshape(b1,[w,w])); 
    subplot(3,3,i)
%  figure,
    imshow(b1)
    j= j +p;
end
subplot(3,3,1);  title('MSB'); 
subplot(3,3,t);  title('LSB');

toc ;

