function [s] = Decimal2binary(bit1)  

a= transpose(de2bi(bit1,8));
c= [fliplr(num2str(a(1:8))) '.' fliplr(num2str(a(9:16))) '.' fliplr(num2str(a(17:24))) '.' fliplr(num2str(a(25:32)))];
c= c(find(~isspace(c)));

s= c;
end





