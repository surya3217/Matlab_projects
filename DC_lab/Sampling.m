% SAMPLING

clc;
clear all;
close all;

t= 0:0.001:1;
f= 50;
x= sin(2*pi*f*t);
subplot(3,1,1);
plot(t,x)
title('Analog signal');
xlabel('t(time) -->');
ylabel('x(sine) -->');

Ts= 0:0.05:1;
y= sin(2*pi*f*Ts);
subplot(3,1,2);
plot(Ts,y)
title('Aliasing');
xlabel('Ts -->');
ylabel('y -->');

clear Ts;
Ts= 0:0.005:1;
z= sin(2*pi*f*Ts);
subplot(3,1,3);
plot(Ts,z)
title('No Aliasing');
xlabel('Ts -->');
ylabel('z(sine) -->');


