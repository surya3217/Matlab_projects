function c = hist_space(inten,fq)

cdf(1) = fq(1) ;          % cdf matrix 
for I = 1:numel(fq)-1
    cdf(I+1) = cdf(I) +  fq(I+1) ;
end
cdf ;   

k = sum(fq) ;
for I =1:numel(fq)
    k1 = cdf(I)*(max(inten))/k ;
    c(I) = round(k1);
end
c ;         % corresponding

end