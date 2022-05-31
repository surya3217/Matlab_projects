clc
clear all
close all

% Histogram Equalization of an image
% Suraj Kumar Saini
% 2015KUEC2015
tic
H = imread('histo.jpg');
% H= rgb2gray(H) ;

subplot(2,1,1)
imshow(H);
title('Original image');

Img= double(H);         % converting uint8 to double
n= numel(Img);            % no. of element in Img matrix  

[Intensity freq]= Histogram_func(Img);     % function call for Histogram

subplot(2,1,2);
bar(Intensity,freq,'b');       % histogram of Image 
title('Histogram of given image');
xlabel('Intensity');  ylabel('Frequency');
xlim([0 260]);
% imhist(H)

%----------------------------------------------------------
% --------------- Histogram Equalization

n2= numel(Intensity);       % no. of elements in Intensity matrix
cdf= zeros(n2,1);
cdf(1)= freq(1);    % cdf for first element like zero 

for i=2:n2
    cdf(i)= cdf(i-1)+ freq(i); 
end
cdf;
cdf_min= min(cdf);      % min value of cdf

hv= zeros(n2,1);          % histogram equalised value for given cdf  
for j=1:n2
    hv(j)= round(((cdf(j)-cdf_min)/(n-1))*255);
    
end
hv ;

for i=1:n2          % replacing hv values in image
    k= find(Img == Intensity(i));    % find non-zero element of Intensity matrix in Img matrix
                                               % k give the index of given no. from Img matrix                   
    for j=1:numel(k)        
        I1(k(j))= hv(i);
    end
end

I1;
I_new= reshape(I1,size(Img));
I_new= uint8(I_new);

figure,
subplot(2,1,1)
imshow(I_new);
title('Histogram Equalization Image')

[Intensity freq]= Histogram_func(I_new);     % function call for Histogram
 
subplot(2,1,2);
% figure,
bar(Intensity,freq);       % histogram of Image  
xlabel('Intensity');  ylabel('Frequency');
xlim([0 260]);
% imhist(I_new)
title('Histogram of Equalised Image');

%-----------------------------------------------------------
%------------------- Histogram using command
figure,
subplot(2,1,1)
histeq(H);
title('Histogram Equalization using Command ');
Histogram2= histeq(H);

% figure,
subplot(2,1,2)
imhist(Histogram2);
title('Histogram of Equalised image using Command ');
Matching = ssim(I_new,Histogram2)*100


%  Histogram_func.m , function's code

% function [Intensity freq]= Histogram_func(H)
% 
% n= numel(H);       % no. of element in I1 matrix
% I= H(:);                % making array
% I1= I;
% I_seq= sort(I);              % sorting of I matrix
% Inten= unique(I_seq);       % unique matrix
% 
% n2= numel(Inten);   % no. of element in unique matrix 
% freq= zeros(n2,1);          % zeros matrix for frequency
% 
% for i=1:n2-1                
%     k= find(I_seq== Inten(i+1));     % finding non-zero no. of intensity matrix in I_seq 
%     freq(i+1)= numel(k);               % k give the index of given no. from Img matrix 
%     
% end
% a= n -sum(freq);    % frequency for zero
% freq(1)=a;
%      
% Intensity= Inten;
% freq= freq; 
% 
% end

toc

