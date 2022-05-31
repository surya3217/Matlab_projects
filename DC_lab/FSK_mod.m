
% Aim- Write a program for Frequency Shift Keying Modulation(FSK)
% ID - 2015kuec2015
clc
close all
close all

t= 0:0.001:1;
fm= 10;        % messege signal frequency
fc= 50;        % carrier signal frequency 
x = 10*sin(2*pi*fc*t);
figure(1);
subplot(2,1,1);
plot(t,x);
title('Sine Wave');
xlabel('time(sec)'); ylabel('Amp.');
axis([0 1 -11 11]);

y= square(2*pi*fm*t);
subplot(2,1,2);
plot(t,y);
title('Square Wave');
xlabel('time(sec)'); ylabel('Amp.');
axis([0 1 -1.2 1.2]);

w = 10*sin(2*pi*(fc+fm)*t);
k = 10*sin(2*pi*(fc-fm)*t);
% Formation of FSK Modulation
for i=1:1001
    if(y(i)>0)
        z(i)= w(i);
    else
         z(i)= k(i);
    end
end

figure(2);
subplot(2,1,1);
plot(t,z);
title('FSK Modulation');
xlabel('time(sec)'); ylabel('Amp.');
axis([0 1 -11 11]);
