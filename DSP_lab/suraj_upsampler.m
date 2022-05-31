function [x,n,L] = suraj_upsampler(x,n1,L)
k = abs(n1(1)*L);
n2= [-k:k];
b= length(n2);

for i= 1:13
    if (rem(n2(i),L) ==0)
       y(i)= 2^(n2(i)/L);
    else
        y(i)=0;
    end
end

subplot(3,1,2)
stem(n2,y); grid on;
suraj_downsampler(y,n2,L);      % function for down-sampling
end

