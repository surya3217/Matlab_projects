clc 
clear all

T = 1;
w = linspace(0,2*pi,50);
% converting digital frequency to analog
omega = 2*tan(w/2)/T;
plot(w,omega);
xlabel('digital frequency');ylabel('analog frequency');