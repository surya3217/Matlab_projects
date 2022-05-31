clc
clear all
close all
% k=input('Enter the range of n');
n= -5:0.1:5;
a= (1/2).^n;
b= n>0;
y= a.*b;

%calulate the fourier transform of y
ft= fft(y);
m= abs(ft);
ph= angle(ft); 

% find the phase of ft
subplot(2,1,1);
plot(n,m);
grid on;

subplot(2,1,2);
plot(n,ph);
grid on;
