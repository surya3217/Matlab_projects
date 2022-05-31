function [cust_sub]= CustomSubnet(def_sub)

k= def_sub;
sub_no= input(' Enter number of needed subnets  :  ');  fprintf('\n');
host_no= input(' Enter number of needed hosts  :   ');   fprintf('\n'); 

while(1)        % loop for subnet growth
    
    fprintf(' Do you see any future growth in --> SUBNET PART \n'); 
    gro_sub=  input(' Enter "Y" for `YES` or "N" for `NO`  :  ','s');  fprintf('\n');
    
    sub_int = sum(double(gro_sub));
    
    if sub_int== 121 || sub_int== 89
        sub_gr= input(' Enter percentage growth in subnet part : ');
        sub_no=  round(sub_no.*sub_gr.*0.01) + sub_no;
        break;
    
    elseif sub_int== 110 || sub_int== 78
        break;
    else
        fprintf('   Invalid input \n You have only two way : "Y" or "N" \n Please enter valid input \n');
        continue;
    end
end


while(1)        % loop for host growth 
    
    fprintf(' Do you see any future growth in --> HOST PART  \n'); 
    gro_host=  input(' Enter "Y" for `YES` or "N" for `NO`  :  ','s'); 
    host_int = sum(double(gro_host));
    
    if host_int== 121 || host_int== 89
        host_gr= input(' Enter percentage growth in host part  :  ');
        host_no=  round(host_no*host_gr*0.01) + host_no;
        break;
    
    elseif host_int== 110 || host_int== 78
        break;
    else
        fprintf(' Invalid input \n You have only two way : "Y" or "N" \n Please enter valid input \n');
        continue;
    end
end

fprintf(' -------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n');

sub_bit= ceil(log(sub_no)/log(2));      % subnet bits
host_bit= ceil(log(host_no)/log(2));    % host bits

def = sum(transpose(sum(de2bi(def_sub))));
left_bits= 32- def ;          % bits of default subnet except subnet and host bits 

if (sub_bit + host_bit) <= left_bits
    cidr= 32- host_bit;
    cust(1:cidr)= 1;
    host(1:host_bit)= 0 ;

%-------------------- calculating custom subnet mask
    cust= [cust  host];
    cust = [cust(1:8); fliplr(cust(9:16)); fliplr(cust(17:24)); fliplr(cust(25:32))];
    cust_sub1 = transpose(bi2de(cust));
    cust_sub= cust_sub1;   

else
    fprintf(' This combination is not possible \n Please give another values \n ');
    cust_sub = CustomSubnet(k);
end

end


