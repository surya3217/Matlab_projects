clc
clear all
close all
% creat matrix and find max value
A = ceil(100*rand(1,10))
b = max(A)
c=b;
i=1;
% find max value digit in binary
while (b>=2)
    b= fix(b/2);
    r= rem(b,2);
    i= i+1;
end
i
% representing no. in binary
m = zeros(10,i);
for j=1:10
    for k=1:i
        if (A(j)>=2)
           m(j,k)= rem(A(j),2);
           A(j)= fix(A(j)/2); 
         
        else
            m(j,k)= fix(A(j));
            break;
      end
    end
end
m;
l = fliplr(m)
% finding even and odd perity
for n=1:10
     c=0;
    for d =1:i  
        if l(n,d) == 1
            c=c+1;
        end 
    end
     if rem(c,2)==1
        if l(n,d)==1
            l(n,d) =0;
        else 
            l(n,d) =1;
        end
    end       
end
l
