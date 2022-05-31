% program of Up-sampling and Down-sampling

clc 
clear all
close all

% L=input('Enter the value of L : ');
L=3;
n1= [-2:2];
a= length(n1);
x= zeros(1,a);      % declaring matrix of zeros for input
for i=1:a
    x(1,i)= 2^n1(1,i);  % input matrix
end  
x
subplot(3,1,1); 
stem(n1,x); grid on;    % plotting graph using stem

suraj_upsampler(x,n1,L);        % function for up-sampling
% suraj_downsampler(x,n1,L);      % function for down-sampling
