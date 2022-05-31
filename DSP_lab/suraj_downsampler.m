function [x,n,L] = suraj_downsampler(x,n2,L)
 g = length(x)
 j=1;
for i= 1:2:g  
    y(j)= x(i);
    j=j+1;
end
y
subplot(3,1,3)
stem(y); grid on;
end
