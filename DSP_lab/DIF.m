clc
clear all
close all

% t= input('Enter the no. of sample : ');
% r= input('Enter the radix : ');
t = 8;
r = 2;
% x= round((rand(1,t)*10)-5);
% y= round((rand(1,t)*10)-5);
% z= complex(x,y);

z= [1 2 -1 2 4 2 -1 2 ];
stage= ceil(log(t)/log(r));
N= r^stage;
z= [z zeros(1,N-t)]
n1= 1; 
n2= N;

disp('First Stage output ');
 h= stages(z,n1,n2)
 
 disp('Second Stage output ');
 t1= stages(h,n1,N/2);
 t2= stages(h,N/2+1,n2);
 k= [t1 t2(N/2+1:n2)]
 
 s1= stages(t1,n1,N/4);
 s1= s1(n1:N/4);
 s2=stages(t1,N/4+1,N/2);
 s2=s2(N/4+1:N/2); 
 
 s3=stages(t2,N/2+1,3*N/4);
 s3=s3(N/2+1:3*N/4);
 s4=stages(t2,3*N/4+1,n2);
 s4=s4(3*N/4+1:N);  
 
 disp('Final output ');
 Z= [s1(1),s3(1),s2(1),s4(1),s1(2),s3(2),s2(2),s4(2)]

%  function h= stages (z,n1,n2)
%   t=ceil((n2-n1)/2);
%   q=n2-n1+1;
% for i=n1:n2
%     if i<n1+t
%         h(i)=z(i)+z(i+t);
%     else
%         h(i)=(-z(i)+z(i-t)).*exp(-j*((2.*pi/q)*(i-t-n1)));
%     end
%   end
% end
  