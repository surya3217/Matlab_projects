% Program for 8-PSK (8-point phase shift keying).

clc
clear all
close all

x = [0 0 0 0 0 1 0 1 0 0 1 1 1 0 0 1 0 1 1 1 0 1 1 1 ];
n1= length(x);
t1 = 0:1: n1-1;
% x1= x;
% x1(n1+1) = x(n1);

subplot(2,1,1);
stairs(t1,x,'r');
grid on;
title('Message signal');
xlabel('sample'); ylabel('amplitude');
axis([0 n1-1 -0.2 1.2]);

t = 0:0.001:n1-0.001;
f = 1/3;
A = 2;

for i = 1:8
    y(i,:)= A*sin(2*pi*f*t + i*pi/4);
end

n2 = length(y(1,:));
n = 1;
for i= 1:3: n1-2
    for j= 1:1:3*n2/n1
         
            if( (x(i)==0 && x(i+1)==0) && x(i+2)==0 )
                z(n) = y(1,j);
                w(1) = A*complex(cos(1*pi/4),sin(1*pi/4));
                
            elseif( (x(i)==0 && x(i+1)==0) && x(i+2)==1 )
                z(n) = y(2,j);
                w(2) = A*complex(cos(2*pi/4),sin(2*pi/4));

            elseif( (x(i)==0 && x(i+1)==1) && x(i+2)==0 )
                z(n) = y(3,j);
                w(3) = A*complex(cos(3*pi/4),sin(3*pi/4));
                
            elseif( (x(i)==0 && x(i+1)==1) && x(i+2)==1 )
                z(n) = y(4,j);
                w(4) = A*complex(cos(4*pi/4),sin(4*pi/4));  
                
            elseif( (x(i)==1 && x(i+1)==0) && x(i+2)==0 )
                z(n) = y(5,j);
                w(5) = A*complex(cos(5*pi/4),sin(5*pi/4));
                
            elseif( (x(i)==1 && x(i+1)==0) && x(i+2)==1 )
                z(n) = y(6,j);
                w(6) = A*complex(cos(6*pi/4),sin(6*pi/4));
                
            elseif( (x(i)==1 && x(i+1)==1) && x(i+2)==0 )
                z(n) = y(7,j);
                w(7) = A*complex(cos(7*pi/4),sin(7*pi/4));
                
            elseif( (x(i)==1 && x(i+1)==1) && x(i+2)==1 )
                z(n) = y(8,j);
                w(8) = A*complex(cos(8*pi/4),sin(8*pi/4));
            end
            n= n+1;
        end
end

subplot(2,1,2);
plot(t,z);
grid on;
axis([0 n1-1 -2.2 2.2]);
title('8-PSK Modulated Wave');
xlabel('sample');
ylabel('amplitude');

figure(2);
hold on;
plot(real(w),imag(w),'*');
axis([-2.2 2.2 -2.2 2.2]);
grid on;
title('Constellation points');
xlabel('real axis');
ylabel('imag axis');

pos =[-2 -2 4 4];
rectangle('position',pos ,'curvature',[1 1]);
axis equal;

