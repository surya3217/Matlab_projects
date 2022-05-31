
% Suraj Kumar Saini
% ID - 2015KUEC2015
% Adaptive filter 

clc
close all
clear all
w = zeros(1,11);
u = 0.002;
t = 0:0.001:1;
x = sin(2*pi*50*t); % input function
figure(1);
subplot(3,1,1);
plot(t,x)
title('Input Signal');
xlabel('time-->'); ylabel('amplitude-->');

y = sin(2*pi*100*t); % interfering function
subplot(3,1,2);
plot(t,y)
title('Interfering Signal');
xlabel('time-->'); ylabel('amplitude-->');

z1 = x+y;
subplot(3,1,3);
plot(t,z1)
title('Addition of Signal');
xlabel('time-->'); ylabel('amplitude-->');

z = rand(1,length(t));      % error
data = z1+(z-0.5);          % data fed to filter
out = 0 ;                       % output of adder
err = zeros(1,length(t)-100);

for i = 2:1:length(t)-100
    d = data(i:i+10);
    out = sum(d.*w);
    err(i) = z1(i) - out ;
    for k = 1:1:length(w)
        
        w(k) = w(k)+2*u*err(i)*data(i+k);
    end
end

err2 = err.* err;
figure(2);
plot(err2)
title('Error');
xlabel('time-->'); ylabel('amplitude-->');

