clc
clear all
close all

% Program of Bit slicing
% Suraj Kumar Saini
% 2015KUEC2015

% creat  random matrix
a= randi([0,7],3,3)     
% a = [7 5 1;6 7 5; 6 6 3] 
w= max(max(a));

i= ceil(log(w)/log(2))      % no. in binary 
t= i;
n= numel(a)
A= transpose(a);

% representing no. in binary
m = zeros(n,i);

for j=1:n
    for k=1:i
        if (A(j)>=2)
           m(j,k)= rem(A(j),2)
           A(j)= fix(A(j)/2) ;
         
        else
            m(j,k)= fix(A(j));
            break;
      end
    end
end

m;
k = fliplr(m)
p= numel(k)

% b1= k(1:n)
% b2= k(n+1:2*n)
% b3= k(2*n+1:p)
% 
% b1= transpose(reshape(b1,[3,3])) 
% b2= transpose(reshape(b2,[3,3]))
% b3= transpose(reshape(b3,[3,3]))

% 1 for white and 0 for black
subplot(3,3,1)
imagesc(a)
title('Original image');

% subplot(2,2,2)
% imshow(b1)
% title('MSB');       % image with parameter
% 
% subplot(2,2,3)
% imagesc(b2)
% 
% subplot(2,2,4)
% imagesc(b3)        % square image
% title('LSB');

j=1;
for i=1:t
    b1= k(j:n*i)
    b1= transpose(reshape(b1,[3,3])) 
    subplot(3,3,i+1)
    imshow(b1)
    j= j +9;
end
subplot(3,3,2);  title('MSB'); 
subplot(3,3,t+1);  title('LSB'); 



