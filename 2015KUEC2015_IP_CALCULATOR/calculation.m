
function [wild]= calculation(ip,cust_sub,def_sub)

ip_bin1= de2bi(ip,8);       % converting addresses decimal to binary
cust_sub_bin= de2bi(cust_sub,8);
def_sub_bin= de2bi(def_sub,8) ;

wild_bin = not(cust_sub_bin);
wild = transpose(bi2de(wild_bin));
fprintf(' Wildcard address \t\t\t\t\t :   ');
fprintf('%d.',wild(1:3)); fprintf('%d \t\t\t : \t',wild(4));

ip_bin18= Decimal2binary(wild);     %-- function, to convert decimal value to binary
fprintf('%s \n',ip_bin18);

%-------- calculate no. of subnet and host bits
k= cust_sub - def_sub;
for i=1:4
    if k(i)==0
        continue;
    else
        m = k(i:end);
        break;
    end
end
% m;
    
k = transpose(de2bi(m,8));
t = numel(k)  ;                        % --------- total bits
h = sum(transpose(sum(k)));   %----------- subnet bits
p = t-h           ;               %------------ host bits
u = 32-t        ;            %------------- left bits

%------------- calculating network address  
net_add_bin = ip_bin1 & def_sub_bin;
net_add_bin2 = transpose(ip_bin1 & def_sub_bin);
% net_add = transpose(bi2de(net_add_bin));

subnet = net_add_bin2(u+1:(u+h));
s = bi2de(subnet);
host = net_add_bin2(u+h+1: end);

fprintf('\n Total number of subnets \t\t\t\t :   %d \n \n', 2^h);
fprintf(' Total number of host addresses per subnet     :   %d \n \n', 2^p);
fprintf(' Number of assignable host address per subnet :   %d \n \n', 2^p-2);
fprintf(' Total number of assignable host addresses \t  :   %d \n \n', (2^h)*(2^p-2));
fprintf(' Number of bits borrowed from host \t\t  :   %d \n \n',h );

%------- calculation for minHost ip address per subnet
bit1 = net_add_bin2;
host2 = bit1(u+h+1:end);

temp = bit1(25);
bit1(25) = 1;

a = bi2de(transpose(bit1));
minHost = transpose(a);

bit1(25)= temp;

%------- calculation for maxHost ip address per subnet
bit1(u+1:end) =1;
bit1 = [bit1(1:u) bit1(u+1:end)];
k1 = [bit1(1:8); bit1(9:16); bit1(17:24); bit1(25:32)];

broadcast = transpose(bi2de(k1));
max = broadcast;
max(4) = max(4)-1;
maxHost = max;

fprintf(' Range of Host addresses \t\t\t\t  :   ');
fprintf('%d.',minHost(1:3)); fprintf('%d   to \t\t',minHost(4));
ip_bin1= Decimal2binary(minHost);
fprintf('%s \n',ip_bin1);

fprintf('\t\t\t\t\t\t\t\t');
fprintf('%d.',maxHost(1:3)); fprintf('%d \t\t\t',maxHost(4));

ip_bin2 = Decimal2binary(maxHost);
fprintf('%s \n\n',ip_bin2);


fprintf(' Broadcast address \t\t\t\t  :   ');
fprintf('%d.',broadcast(1:3)); fprintf('%d \t\t\t',broadcast(4));
ip_bin3= Decimal2binary(broadcast);
fprintf('%s \n \n',ip_bin3);

fprintf(' ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- \n');
fprintf('   ************************************************** ADDRESS * RANGE * FOR * SUBNET ************************************************** \n');
fprintf(' -----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n\n');

z = transpose(net_add_bin);     % network address

if h<8 && p>8
    
    if p>16
        
        for i=1:2^h
            subnet = fliplr(de2bi(i-1,h));
            w = 8- h;
            host1(1:p)= 0 ;
            subnet1 = [subnet host1(1:w)] ;
            host1(1:w) = [] ; 
    
            fprintf(' %d)      ',i);
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t   to   \t');

            host1(1:p)=1 ;
            subnet1= [subnet host1(1:w)];
            host1(1:w)= []; 
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
             range_bin2= SubnetRange(q);
             
             b2= Decimal2binary(range_bin2);  
             fprintf('\t : \t %s \t to     %s \n',b1,b2); fprintf('\n');
         end
        
    else
        
         for i=1:2^h
             subnet = fliplr(de2bi(i-1,h));  
             w = 8- h;
             host1(1:p)= 0 ;
             subnet1 = [subnet host1(1:w)];
             host1(1:w) = []; 
    
             fprintf(' %d)    ',i);
             q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
              range_bin1= SubnetRange(q);
             b1= Decimal2binary(range_bin1);   
             fprintf('\t   to   \t');

             host1(1:p)=1 ;
             subnet1= [subnet host1(1:w)];
             host1(1:w)= []; 
             q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
             SubnetRange(q);
             range_bin2= SubnetRange(q);
             b2= Decimal2binary(range_bin2);   
             
             fprintf('\t : \t %s \t to     %s \n',b1,b2); fprintf('\n');

         end
end
    
elseif h>=8 && p <=8
    
    if h>16
        
         for i=1:2^h
            subnet = fliplr(de2bi(i-1,h));
            w= h- 16;
            subnet1 = subnet(1:16);
            host(1:p)= 0 ;
            host1= [subnet(16:16+w) host];
    
            fprintf(' %d)     ',i);
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t   to   \t');

            host(1:p)=1 ;
            host1= [subnet(16:16+w) host];
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
          range_bin2= SubnetRange(q);
          b2= Decimal2binary(range_bin2);   
          
          fprintf('\t : \t %s \t to     %s \n',b1,b2); fprintf('\n');

         end
        
    else
    
        for i=1:2^h
            subnet = fliplr(de2bi(i-1,h));
            w= h- 8;
            subnet1 = subnet(1:8);
            host(1:p)= 0 ;
            host1= [subnet(9:8+w) host];
    
            fprintf(' %d)     ',i);
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t  to  \t');
    
            host(1:p)=1 ;
            host1= [subnet(9:8+w) host];
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
           range_bin2= SubnetRange(q);
           b2= Decimal2binary(range_bin2);   
          
          fprintf('\t : \t %s \t to     %s \n',b1,b2); fprintf('\n');
    
        end
    end
    
elseif h<8 && p<8
    
    for i=1: 2^h
          subnet = fliplr(de2bi(i-1,h));
          w= 8- h;
          host(1:p)=0;
          subnet1 = [subnet host];
          fprintf(' %d)     ',i);
          q = [z(1:u) fliplr(subnet1)];

          range_bin1= SubnetRange(q);
          b1= Decimal2binary(range_bin1);    
          fprintf('\t   to   \t');
    
          host(1:p)=1 ;
          subnet1= [subnet host];
          q = [z(1:u) fliplr(subnet1)];
    
          range_bin2= SubnetRange(q);
          b2=  Decimal2binary(range_bin2);
          
          fprintf('\t : \t %s \t to     %s \n',b1,b2); fprintf('\n');

    end
    
elseif h>8 && p>8
        
        for i=1:2^h
            subnet = fliplr(de2bi(i-1,h));
            w = 8- h;
            host1(1:p)= 0 ;
            subnet1 = [subnet host1(1:w)];
            host1(1:w) = []; 
    
            fprintf(' %d)      ',i);
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
            range_bin1= SubnetRange(q);
            b1= Decimal2binary(range_bin1);   
            fprintf('\t   to   \t');

            host1(1:p)=1 ;
            subnet1= [subnet host1(1:w)];
            host1(1:w)= []; 
            q = [z(1:u) fliplr(subnet1) fliplr(host1)];
    
            range_bin2= SubnetRange(q);
            b2= Decimal2binary(range_bin2);   
          
            fprintf('\t : \t %s \t to     %s \n',b1,b2);  fprintf('\n');

         end
    
end

nthSubnet(z,h,p,u);

end

