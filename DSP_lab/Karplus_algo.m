% Simplest Plucked String model: Karplus Strong Algorithm
% This matlab function implements the Karplus Strong
% algorithm. It uses the following difference equation.
% y[n] = x[n] + 0.5 y[n-N] + 0.5 y[n-(N+1)] ;
clc ;
close all ;
clear all ;

fs          =    100     ;
freqHz      =    10   ;
iterations  =    1000   ;

% kastro(freqHz, iterations, fs) ; 
% freqHz : frequency in Hz (rouding occurs when computing delay line!)
% iterations : # of loops (duration of sound file)
% fs : sampling frequency
% function signal = kastro(freqHz, iterations, fs)
% Echo some useful information
% ---------------------------------------------------------------------------
N  =  fs/freqHz   ;
N  =  floor(N)    ;
x  =  2*rand(1,N) ;
x  =  x - mean(x) ;
% generate noise and init. delay line
% make sure burst and delay line agree: burst >= delay line
% ---------------------------------------------------------------------------
y = [zeros(1,N+1)];

if iterations > length(x) 
diff = iterations - length(x);
x = [x zeros(1,diff)];
end
% Filtering
% y[n] = x[n] + 0.5 y[n-N] + 0.5 y[n-(N+1)]
% ---------------------------------------------------------------------------
% init.
out = 0;
signal = 0;
lengthYOffset = length(y)-1;
for i=1:iterations
out = x(i) + 0.5*(y(N) + y(N+1)); % filter signal
y = [out, y(1:lengthYOffset)]; % update delay line
signal = [signal out];
end
% Play sound and plot
% ---------------------------------------------------------------------------
plot(signal), grid on, title('Simple Karplus Strong algorithm');
% sound(signal, fs);
