clc 
close all 
clear all 

tic ;
% Histogram specification 
% function with name :  hist_space

inten = [0 1 2 3 4 5 6 7 ]      % intensity
c0 = inten ;
fq = [8 10 10 2 12 16 4 2 ]            % frequency 
sp_fq = [0 0 0 0 20 20 16 8 ]

% perform simple histogram 
op = hist_space(inten,fq) 
c1 = op  


% perform histogram specification 
fq = sp_fq ;
op = hist_space(inten,fq) ;
c2 = op 

if c1==c2
   fprintf('histogram specification is not possible\n')
   return ;
end
% Now we have c0 , c1 , c2 
for I =1:numel(fq)
   k = find(c2 >= c1(I),1,'first') ; % to write first is optional
   c3(I) = c0(k) ; % match value in c0
    
end
c3 


toc ;


