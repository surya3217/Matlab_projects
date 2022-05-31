clc
clear all
close all

% x= round(63*rand(1,10))
% y= round(63*rand(1,10))
x= [28,24,48,50,12,31,28,41,45,48]
y= [17,43,41,10,7,31,60,21,37,14]
plot(x,y,'r*')

% txt2 = '  0.71' ;
for i=1:10
    p=x(i) ;
    q= y(i) ;
    text(p,q,sprintf('  (%.f,%.f)%.f',p,q,i))
end

% text(x,y,txt2)
% text(x,y,num2str);

axis([0 63 0 63])

xx= repmat(x,10,1)
yy= repmat(y,10,1)
xx1= xx';
yy1= yy';

D= (xx-xx1).^2+ (yy-yy1).^2 ;
D= sqrt(D)

tree = linkage(D,'average');
figure(), 
dendrogram(tree)



