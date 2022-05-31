% AIM - BPSK modulation
% ID --> 2015KUEC2015

clc 
close all 
clear all 

t = 0:0.001:1 ;
fm = 5 ;                       % message signal frequency 
fc = 50;                       % carrier signal frequency 

x = 10*sin(2*pi*fc*t) ; 
figure(1);
subplot(2,1,1) ;
plot(t,x) ;
title('Sine wave/carrier wave') ; 
xlabel('time(sec)') ;   ylabel('Amplitude')  ; 
axis([0 1 -11 11]);

y = square(2*pi*fm*t) ; 
subplot(2,1,2) ;
plot(t,y) ;
title('Square wave/message signal') ; 
xlabel('time(sec)') ;   ylabel('Amplitude')  ; 
axis([0 1 -1.2 1.2]);

y1 = 10*sin(2*pi*fc*t + 0) ; 
y2 = 10*sin(2*pi*fc*t + pi) ; 

for i =1:1001
    if(y(i) > 0)
        z(i) = y1(i) ;
    else
        z(i) = y2(i);
    end
end

figure(2);
subplot(2,1,1)
plot(t,z) ;     % PBSK modulated wave
title('BPSK modulated wave') ; 
xlabel('Time(sec)-->') ;ylabel('Amplitude-->')  ; 
axis([0 1 -11 11]);
