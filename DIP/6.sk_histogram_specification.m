clc
clear all
close all

% Histogram Specification
% Suraj Kumar Saini
% 2015KUEC2015

tic
% H= randi([0,7],8,8)
H= [0,2,0,2,7,3,3,2;7,1,2,0,6,4,2,7;5,2,5,1,2,2,6,7;1,0,6,5,4,5,6,2;3,7,4,5,7,4,5,6;0,0,5,7,5,5,1,7;2,7,7,4,6,2,0,4;2,3,0,0,3,1,4,7]
H= uint8(H);
imagesc(H)

H= double(H);

n= numel(H);       % no. of element in I1 matrix
I= H(:);                % making array
I1= I;
I_seq= sort(I);              % sorting of I matrix
Inten= unique(I_seq) ;      % unique matrix
Intensity= Inten'

n2= numel(Inten);   % no. of element in unique matrix 
freq= zeros(n2,1);          % zeros matrix for frequency

for i=1:n2-1                
    k= find(I_seq== Inten(i+1));     % finding non-zero no. of intensity matrix in I_seq 
    freq(i+1)= numel(k);               % k give the index of given no. from Img matrix 
    
end
a= n -sum(freq);    % frequency for zero
freq(1)=a;
freq;
frequency= freq'


n2= numel(Inten);       % no. of elements in Intensity matrix
cdf= zeros(n2,1);
cdf(1)= freq(1);    % cdf for first element like zero 

for i=2:n2
    cdf(i)= cdf(i-1)+ freq(i); 
end
cdf;
% cdf_min= min(cdf);      % min value of cdf

hv= zeros(n2,1);          % histogram equalised value for given cdf  
for j=1:n2
    hv(j)= round((cdf(j)*7)/n);
    
end
hv;
hv_mat= hv'
toc ;




