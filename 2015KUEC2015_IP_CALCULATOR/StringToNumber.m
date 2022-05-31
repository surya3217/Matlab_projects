function [octal]= StringToNumber(m,n)

count=0;
for s=1:n
    if m(s)=='.'
        count=count+1;
    end
end
count;


for i=1:n
    
    g= double(m(i));
    if  (g>= 58 && g<= 126) ||  (g> 34 && g<= 47)
        u= 0;
        break;
    else 
        u= 1;
        break;
    end
end
                 

if u ~=0 && count==3 && n>= 7
    
p= 1;
    for i= 1:4
        k= 1;
        for j= p:n
            if m(j) ~= '.'
                oct(k) = m(j);
                k= k+1;
            else
                p= j+1;
                break;
            end
        end
       
         octal(i) = str2num(oct);
         oct(1:end)= []; 
    end
    octal = octal;    
    
else
    octal = 0; 
    
end

end



