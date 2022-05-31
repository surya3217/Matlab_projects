clc
clear all
close all

n= input('Enter no. of element : ');
x= round(15*rand(1,n))
% x = [10,10,11,7,1,3,14,2,12,8]
y= de2bi(x);
y= fliplr(y);
z= suraj_hamming(y);
disp('Starting code');
disp(y);
disp('Hamming code');
disp(z);
