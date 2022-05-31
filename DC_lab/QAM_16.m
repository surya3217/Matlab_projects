clc ;
clear all;
close all;


j = 9 ;

x = [0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 1 0 0 0 1 0 1 0 1 1 0 0 1 1 1 1 0 0 0 1 0 0 1 1 0 1 0 1 0 1 1 1 1 0 0 1 1 0 1 1 1 1 0 1 1 1 1]
numel(x)

for I = 1:4:numel(x)-3
x1(1) = x(I)   ;
x1(2) = x(I+1) ;
x1(3) = x(I+2) ;
x1(4) = x(I+3) ;

y(1 + (I-1)/4 )  = bi2de(x1,'left-msb') ;
end

a = 1.6568 ;
b = 4 ;
k = 0 ;
numel(y) ;
p = sqrt(b*b + b*b) ;
q = sqrt(a*a + a*a) ;

x1 = [1 1 1 1 1 0 0 0 0 0 1 0 0 1 1 1 ]

figure(1)
t = 0:1:numel(x1)
x2 = x1 ;
x2(numel(x1)+1) = x1(numel(x1)) ;
subplot(2,1,1)
stairs(t,x2) ;
grid on ;
ylim([-0.2 1.2])
f = 1 

t1 = 0:0.01:numel(x1)-0.01 ;
z1 = sin(2*pi*f*t1 + pi+pi/4);
z2 = sin(2*pi*f*t1 + pi/2+pi/4);
z3 = sin(2*pi*f*t1 + pi/4+pi/8);
z4 = sin(2*pi*f*t1 - pi/4)

for I = 1:100*numel(x1)
   if(I<=400) 
    z5(I) = sqrt(2*b*b)*z1(I);
   elseif(I<=800  && I > 400)
    z5(I) = sqrt(2*a*a)*z2(I-400);
   elseif(I<=1200  && I >800)
    z5(I) = sqrt(a*a+b*b)*z3(I-800);
   else
    z5(I) = sqrt(b*b+b*b)*z4(I-1200);
   end
end
   subplot(2,1,2)
   t1 = 0:0.01:numel(x1)-0.01 ;
   plot(t1,z5) ;
   grid on ;


for I = 1: numel(y)
    
 if(rem(y(I),4) == 0)   
   z(I) = sqrt(a*a + a*a)*complex(cos(pi/4 + ((I-1)/4)*pi/2),sin(pi/4 + ((I-1)/4)*pi/2 ) ) 
 
 elseif(rem( (y(I)-3),4 ) == 0)
     
  z(I) = sqrt(b*b + b*b)*complex(cos(pi/4 + ((I-4)/4)*pi/2),sin(pi/4 + ((I-4)/4)*pi/2 ) ) 
 
 else
    an = pi/4 ;
      %z(I) = sqrt(p*p*cos(an).^2 + q*q*sin(an).^2)*complex(cos(pi/8 + k*pi/4),sin(pi/8 + k*pi/4 ) ) 
   z(I) = sqrt(a*a + b*b)*complex(cos(pi/8 + k*pi/4),sin(pi/8 + k*pi/4 ) ) 
      k = k+1 ;
 end
end
    
figure(2)
plot(real(z),imag(z),'*')
grid on ;
axis([-6 6 -6 6])
title('constellation points');
xlabel('real axis-->')
ylabel('imaginary axis-->')


% pos = [-4 -4 8 8]
% rectangle('position',pos,'curvature',[1 1])
% axis equal