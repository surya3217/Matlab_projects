clc
clear all
close all

% Program of Bit slicing
% Suraj Kumar Saini
% 2015KUEC2015
tic;            % give the program execution time

% creat  random matrix
% a= randi([0,7],3,3)     
a = [7 5 1;6 7 5; 6 6 3] 
w= max(max(a));

i= ceil(log(w)/log(2))      % no. in bits
t= i;
n= numel(a)          % no. of elements in matrix
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

% 1 for white and 0 for black
subplot(2,2,1)
a= mat2gray(a)
imshow(a)
title('Original image');

j=1;
for i=1:t
    b1= k(j:n*i);
    b1= transpose(reshape(b1,[3,3])) ;
    subplot(2,2,i+1);
    imshow(b1);
    j= j +9;
end
subplot(2,2,2);  title('MSB'); 
subplot(2,2,t+1);  title('LSB'); 
toc;


