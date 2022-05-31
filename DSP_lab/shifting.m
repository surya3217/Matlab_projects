clc
clear all
close all

% n=input('Enter the no. of samples : ');
n= 5;
x= round(5*rand(1,n))
s= randi([-2,2]);
y= s:s+n-1;
z= input('Enter how many times shfting you want : ');
subplot(4,1,1) 
stem(y,x);

k=flip(y);
subplot(4,1,2)
stem(k,x);
suraj_shift(x,y,z)
