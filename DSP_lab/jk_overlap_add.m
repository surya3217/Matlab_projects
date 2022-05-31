
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
if rem(length(x),L)>0
    x = [x zeros(1,(L)-rem(length(x),L))];
end
aa = zeros(N,N);
h = transpose(h);
for i = 1:N
    aa(:,i) = circshift(h,i-1)
end
g = length(x)/L;
out = zeros(N,g);
k=1;
for i = 1:L:length(x)
    ab = [x(i:i+L-1) zeros(1,M-1)];
    ab = transpose(ab);
    ac = aa*ab;
    out(:,k)= ac
    k = k+1;
end

kk = [];
for i = 1:g
    if i==1
%         as = out(L+1:N,i)+out(1:M-1,i+1)
        kk = [kk transpose(out(1:L,i)) transpose(out(L+1:N,i)+out(1:M-1,i+1))];
%         as = out(L+1:N,i)+out(1:M-1,i+1);
    elseif i==g
        kk = [kk transpose(out(M:N,i))];
    else
        kk = [kk transpose(out(M:L,i)) transpose(out(L+1:N,i)+out(1:M-1,i+1))];
    end
end
convol = kk(1:a+M-1)

