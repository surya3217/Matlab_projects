function [Intensity freq]= Histogram_func(H)

n= numel(H);       % no. of element in I1 matrix
I= H(:);                % making array
I1= I;
I_seq= sort(I);              % sorting of I matrix
Inten= unique(I_seq);       % unique matrix

n2= numel(Inten);   % no. of element in unique matrix 
freq= zeros(n2,1);          % zeros matrix for frequency

for i=1:n2-1                
    k= find(I_seq== Inten(i+1));     % finding non-zero no. of intensity matrix in I_seq 
    freq(i+1)= numel(k);               % k give the index of given no. from Img matrix 
    
end
a= n -sum(freq);    % frequency for zero
freq(1)=a;
     
Intensity= Inten;
freq= freq; 

end