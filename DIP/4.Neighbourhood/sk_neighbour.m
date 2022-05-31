clc
clear all
close all

% Neighbourhood operation on image
% Suraj Kumar Saini
% 2015KUEC2015
  
tic     % to find time complexity
D = imread('saniya.jpg');       % read the image
title('Original Image');
D= rgb2gray(D) ;            % converting RGB to Gray image   
subplot(1,2,1)
imshow(D);
D= double(D);           % convert image to double
%  D = [62 50 121; 237 64 90; 89 157 212]

new= neighbour_matrix(D);     % function call
 
new_img= uint8(new);     % converting double to image
% figure,
subplot(1,2,2)
D_new= imshow(new_img);  % displaying final image
        
%----------------------------------------------------------------------------
% % neighbour_matrix.m ,   Function's code
% function [new]= neighbour_matrix(D)
% 
% y= size(D);        % give no. of rows and colomns of matrix
% ny=numel(y);
% 
% p= padarray(D,[1,1],0);      % padding of zeros in matrix   
% w= zeros(y(1),y(2));     % y(1)=512
% 
% if ny==2
%     y(3)=1;
% end
% 
% for color=1:y(3)
%     
%  for i=1:y(1)
%      for j=1:y(2)
%                   
%          k= p(i:2+i , j:2+j, color);     % 3*3 matrix of image
%          n= numel(k);         % no. of elements in k
%          z= zeros(3,3);
%            
%         for h=1:n         % making 0 & 1 matrix ,n=9
%             t= k(5);
%             if k(h)>= t
%                 z(h)=1;
%             end
%         end
%         z;
%         c= [z(8) fliplr(z(1,:)) z(2) z(3,:) ];      % binary matrix
%         q=bi2de(c);        % equalent decimal value
%         
%         w(i,j,color)= q;      % updating corresponding value in matrix
%      end
%  end
% end
% 
%  new= w;
% return;
% end


toc