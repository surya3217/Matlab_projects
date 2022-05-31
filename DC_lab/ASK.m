% AIM - ASK modulation
% ID --> 2015KUEC2015

clc 
close all 
clear all 

Ac= 10;
t = 0:0.001:1 ;
f1 = 30 ;                       % message signal frequency 
f2 = 5;                       % carrier signal frequency 

x = Ac*sin(2*pi*f1*t) ; 
figure(1);
subplot(2,1,1) ;
plot(t,x) ;
title('Sine wave/carrier wave') ; 
xlabel('time(sec)') ;   ylabel('Amplitude')  ; 
axis([0 1 -11 11]);

y = square(2*pi*f2*t) ; 
subplot(2,1,2) ;
plot(t,y) ;
title('Square wave/message signal') ; 
xlabel('time(sec)') ;   ylabel('Amplitude')  ; 
axis([0 1 -1.2 1.2]);

for i =1:1001
    if(y(i) > 0)
        z(i) = x(i).*y(i) ;
    else
        z(i) = 0;
    end
end

figure(2);
subplot(2,1,1)
plot(t,z) ;     % PBSK modulated wave
title('ASK modulated wave') ; 
xlabel('Time(sec)-->') ;ylabel('Amplitude-->')  ; 
axis([0 1 -11 11]);

