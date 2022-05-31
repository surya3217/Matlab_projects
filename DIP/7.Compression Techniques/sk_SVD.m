clc
clear all
close all

% SVD compression of image
% Suraj Kumar Saini
% 2015KUEC2015

A= [1 2; 2,1]
% A= [1 0; 0 1]
k= size(A);
p= A*A';

if(p==A)
    fprintf('SVD is not possible \n');
    return
end

[V val]= eig(p);        % V= eigen vector  , val= eigen value
V
D= sqrt(val)            % diagonal matrix

for i = 1:k(1)
    U1 = A*V(:,i)/D(i,i);
    U(:,i) = U1 ;
end
U

x= U*D*V'           % original matrix recovering
