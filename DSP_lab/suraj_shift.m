function [a,b,c] = suraj_shift(x,y,z)
a=x;
b=y+z;
c=z;
subplot(4,1,3)
stem(b,a);

i=flip(b);
subplot(4,1,4)
stem(i,a);
end
