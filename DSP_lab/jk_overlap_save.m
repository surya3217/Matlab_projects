%overlap save
clc
close all
clear all

x = input('Enter Sequence : ');
h = input('Enter Frequency Response : ');
N = input('Enter block size :');
M = length(h);
a  = length(x);
L = N-M+1;
h = [h zeros(1,L-1)];
if rem(length(x),L)>0           % use to make sequence even
    x = [x zeros(1,(2*L)-rem(length(x),L))];
else
    x = [x zeros(1,L)];
end

aa = zeros(N,N);   % make matrix for h(n)
h = transpose(h);
for i = 1:N             % h(n) matrix by shifting
    aa(:,i) = circshift(h,i-1);
end
g = length(x)/L;
out = zeros(N,g);
k = 1;
for i = 1:L:length(x)
    if i == 1
        ab = [zeros(1,M-1) x(1:L)];
    else
%         ab = [ab(N-L+1:N) x(i+L-1)]
        ab = x(i-M+1:i+L-1);
    end
    ab = transpose(ab);
    ac = aa*ab;
    out(:,k)= ac
    k = k+1;
end
out = out(M:size(out,1),:)
out = reshape(out,[1,numel(out)])
out = out(1:a+M-1)
