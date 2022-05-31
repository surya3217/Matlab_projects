
% Suraj Kumar Saini
% ID - 2015KUEC2015
% Program for Average filter

clc
close all
clear all

% randomly taking 1000 samples between 0 and 1
x = rand(1,1000);
a1 = mean(x);       % calculating mean of samples
subplot(2,1,1);     % plotting the sample
plot(x);

y = x -0.5;      % reducing noise
a2 = mean(y);
k = zeros(1,900);
for i = 1:900
    k(i) = mean(y(i:i+100));
end
d = abs(k);
subplot(2,1,2);   % plotting the samples
plot(d);
title('Mean zero')
xlabel('samples'); ylabel('amp.');

