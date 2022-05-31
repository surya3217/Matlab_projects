clc
clear all;
close all;

f=50;
t=0:0.1:2 ;
fs=2*f;

% input signal
x = sin(2*pi*f*t/fs);
subplot(3,1,1);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title(' input signal');

%Sampled signal
x = sin(2*pi*f*t/fs);
subplot(3,1,2);
stem(t,x);
xlabel('samples');
ylabel('amplitude');
title('sampled signal');

% Quantizer
% taking different quantized values
q = 0.8*ceil(x*10);
subplot(3,1,2);
stairs(t,q);            % plotting qauntizer output
xlabel('samples');
ylabel('amplitude');
title('Quantized signal');

%Encoder
x = round(q);       %rounding the values
y = x<0;        %separating positive and negative nos
y = y*2^4;    %converting nos in bits and storing sign bit for positive and negative nos 
x = abs(x);
x1 = x + y;
a = de2bi(x1);

a = transpose(a);       %transpose of matrix a
lx = length(a);         %calculating length of matrix
t1 = 0:0.1/5:2.08;

b = reshape(a,1,lx*5);   %converting a matrix into vector
subplot(3,1,3);             %plotting the bits
stairs(t1,b);
axis([ 0 2.1 -1 2]);
xlabel('time');
ylabel('amplitude');
title('encoder output');

