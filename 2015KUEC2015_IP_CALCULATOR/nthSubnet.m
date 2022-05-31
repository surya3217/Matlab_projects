function []= nthSubnet(z,h,p,u)

while 1
    
sub_no = input(' Enter a value for nth subnet number which you want : ');  fprintf('\n');
host_no = input(' Enter a value for nth host number which you want  : ');  fprintf('\n');

if sub_no <= 2^h && host_no <= 2^p
    
    
subnet = fliplr(de2bi(sub_no-1,h));
host = fliplr(de2bi(host_no,p));

if h<8 && p>8
    
    if p>16
        
            w = 8- h;
            subnet1 = [subnet host(1:w)] ;
            host(1:w) = [] ; 

            q = [z(1:u) fliplr(subnet1) fliplr(host)];
            fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
            
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t %s \n',b1);
        
    else
        
             w = 8- h;
             subnet1 = [subnet host(1:w)];
             host(1:w) = []; 
    
             q = [z(1:u) fliplr(subnet1) fliplr(host)];
             fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
             
             range_bin1= SubnetRange(q);
             b1= Decimal2binary(range_bin1);   
             fprintf('\t %s \n',b1);

end
    
elseif h>=8 && p <=8
    
    if h>16
        
            w= h- 16;
            subnet1 = subnet(1:16);
            host= [subnet(16:16+w) host];
    
            q = [z(1:u) fliplr(subnet1) fliplr(host)];
            fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
            
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t %s \n',b1);
        
    else
    
            w= h- 8;
            subnet1 = subnet(1:8);
            host= [subnet(9:8+w) host];
    
            q = [z(1:u) fliplr(subnet1) fliplr(host)];
            fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
            
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t %s \n',b1);
    
    end
    
elseif h<8 && p<8
    
          w= 8- h;
          subnet1 = [subnet host];
          q = [z(1:u) fliplr(subnet1)];
          
          fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
          range_bin1= SubnetRange(q);
          
          b1= Decimal2binary(range_bin1);    
          fprintf('\t %s \n',b1);
    
elseif h>8 && p>8
        
            w = 8- h;
            subnet1 = [subnet host(1:w)];
            host(1:w) = []; 

            q = [z(1:u) fliplr(subnet1) fliplr(host)];
            fprintf(' Network address of %dth host of %dth Subnet  :   ',host_no,sub_no);    
            
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t %s \n',b1);
    
end
break;

else
    fprintf(' Entered value is out of range \n Maximum value for subnet is %d and for host is %d \n',2^h,2^p); 
    continue;
    
end

end

