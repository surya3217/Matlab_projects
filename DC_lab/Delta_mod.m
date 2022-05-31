
% Aim - Write a program for Delta Modulation.
% ID-2015kuec2015

clc 
clear all
close all
n = 22;            % n=input('Enter the no. of samples : ');
t = 0:2*pi/n:4*pi;

x = 10*sin(t);
figure(1)
subplot(2,1,1);
plot(x);         % plot original signal
title('Sine wave'); 
xlabel('time-->'); ylabel('Amp.-->');
axis([0 45 -11 11]);

subplot(2,1,2);
stem(x);
title('Sampled signal'); 
xlabel('time-->'); ylabel('Amp.-->');
axis([0 45 -11 11]);

%plot Quantized signal of sine wave 
y = ceil(x);   
figure(2)
subplot(2,1,1);
stairs(y)
title('Quantized signal'); 
xlabel('time'); ylabel('amp.');
axis([0 45 -11 11]);

k= numel(y);
for j= 2:k
    if(y(j) - y(j-1) >=0)
        z(j-1)= 1;
    else
        z(j-1)= 0;
    end
end

% plot for delta modulation
subplot(2,1,2);
stairs(z);
title('Delta Modulation');
xlabel('time'); ylabel('Amp');
axis([0 45 -0.2 1.2]);
