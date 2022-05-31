% Program for QPSK (Quadrature phase shift keying).

clc
clear all
close all

x = [0 0 0 1 1 0 1 1 0 0 0 0 1 1 1 0 0 1 0 0 0 0 ];
n1= length(x);
t1 = 0:1: n1-1;

subplot(3,1,1);
stairs(t1,x,'r');  grid on;
title('Message signal');
xlabel('sample');
ylabel('amplitude');
axis([0 n1-1 -0.2 1.2]);

t = 0:0.001:n1-0.001;
f = 2;
y = sin(2*pi*f*t);
n2 = length(y);
y1 = sin(2*pi*f*t + pi/4);
y2 = sin(2*pi*f*t + 3*pi/4);
y3 = sin(2*pi*f*t + 5*pi/4);
y4 = sin(2*pi*f*t + 7*pi/4);

n=1;
for i= 1:2: n1-1
    for j= 1:1: n2/n1
        for k= 1:1:2
            
            if( x(i)==0 && x(i+1)==0 )
                z(n) = y1(j);
                w(1) = 0.707*complex(cos(1*pi/4),sin(1*pi/4));
                
            elseif( x(i)==0 && x(i+1)==1 )
                z(n) = y2(j);
                w(2) = 0.707*complex(cos(3*pi/4),sin(3*pi/4));

            elseif( x(i)==1 && x(i+1)==0 )
                z(n) = y3(j);
                w(3) = 0.707*complex(cos(5*pi/4),sin(5*pi/4));
            else
                z(n) = y4(j);
                w(4) = 0.707*complex(cos(7*pi/4),sin(7*pi/4));                
            end
            n= n+1;
        end
    end
end

subplot(3,1,2);
plot(t,z);
grid on;
xlim([0 n1]);
title('QPSK Modulated Wave');
xlabel('sample');
ylabel('amplitude');

subplot(3,1,3);
plot(real(w),imag(w),'*');
axis([-1 1 -1 1]);
grid on;
title('Constellation points');
xlabel('real axis');
ylabel('imag axis');

           