
% Suraj Kumar Saini
% IP calculator

clc
clear all
close all

diary('E:\Matlab\bin\IP_CALC\out.txt')
diary on

fprintf(' --------------------------------------------------------------------------------------------------------------------------------- -------------------------------------\n');
fprintf('   ********************************************** WELCOME * IN * IP * CALCULATOR *************************************************** \n');
fprintf(' -----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n');

while(1)

    fprintf(' Choose any option to proceed : \n');
    fprintf(' 1) Enter 1 for IP address and Custom subnet mask \n');
    fprintf(' 2) Enter 2 for Network address with number of subnet and number of host \n\n');
    
    while 1
        
    acc= input(' Enter value :  ');
    if acc ==2
        k = input(' Please enter Network Address  :  ','s'); fprintf('\n');
        n = numel(k);
        break;
    elseif acc==1
        k = input(' Please enter IP Address  :  ','s'); fprintf('\n');
        n = numel(k);
        break;
    else
        fprintf(' Invalid Input\n');
        continue;
    end
    
    end
    
% ---------- function to convert ip address (string) into integer array
ip = StringToNumber(k,n);

% ----------  calculation for class A network address  ---------------------

if ip(1)> 1 && ip(1)<127 && ip(2)<255  && ip(3)<255  &&  ip(4)<255 
    
    def_sub= [255 0 0 0];
    
%---------- function, to find custom subnet    
    if acc ~=1  
        cust_sub= CustomSubnet(def_sub);
    else
        cust2= input(' Please enter Custom subnet mask  :  ','s'); fprintf('\n');
        n = numel(cust2);
        cust_sub= StringToNumber(cust2,n);
    end
    
    fprintf('\n Class \t\t\t\t\t\t :   A  \n\n');
    
    fprintf(' Network address \t\t\t\t\t :   ');
    fprintf('%d.',ip(1:3));  fprintf('%d\t\t',ip(4));
    ip_bin4 = Decimal2binary(ip);           %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin4); fprintf('\n');
    
    fprintf(' Default subnet mask \t\t\t\t :   255.0.0.0 \t\t\t');
    ip_bin5 = Decimal2binary(def_sub);
    fprintf('%s \n',ip_bin5); fprintf('\n');
    
    fprintf(' Custom subnet mask \t\t\t\t :   ');
    fprintf('%d.',cust_sub(1:3)); fprintf('%d\t\t',cust_sub(4));
    ip_bin6 = Decimal2binary(cust_sub);
    fprintf('%s \n',ip_bin6);  fprintf('\n');
    
%---- function to calculating parameters using ip,custom address and defalut address
    calculation(ip,cust_sub,def_sub);       
                                                                    
   
% ---------------  calculation for Local Loopback address -----------------------

elseif ip(1)==127 && ip(2)<255  && ip(3)<255  &&  ip(4)<255
    fprintf('\n Class \t\t\t\t\t\t :   A \n\n');
    
    fprintf(' Network address \t\t\t\t\t :   ');
    fprintf('%d.',ip(1:3));   fprintf('%d \t\t\t',ip(4));
    ip_bin7 = Decimal2binary(ip);           %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin7); fprintf('\n');
    fprintf(' Network 127 is reserved for loopback and internal testing. \n');
    
    
% ------------  calculation for class B network address --------------------  

elseif ip(1)>=128 && ip(1)<=191 && ip(2)<255  && ip(3)<255  &&  ip(4)<255
    
    def_sub= [255 255 0 0];
    if acc ~=1  
        cust_sub= CustomSubnet(def_sub);
    else
        cust2= input(' Please enter Custom subnet mask  :  ','s'); fprintf('\n');
        n = numel(cust2);
        cust_sub= StringToNumber(cust2,n);
    end
    
%---------- function, to find custom subnet  
%     cust_sub= CustomSubnet(def_sub);
    
    fprintf('\n Class \t\t\t\t\t\t :   B \n\n');
    
    fprintf(' Network address \t\t\t\t\t :   ');
    fprintf('%d.',ip(1:3));  fprintf('%d \t\t : \t',ip(4));
    ip_bin8 = Decimal2binary(ip);           %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin8);  fprintf('\n');
    
    fprintf(' Default subnet mask \t\t\t\t :   255.255.0.0 \t\t : \t')
    ip_bin12 = Decimal2binary(def_sub);
    fprintf('%s \n',ip_bin12);  fprintf('\n');
    
    fprintf(' Custom subnet mask \t\t\t\t :   ');
    fprintf('%d.',cust_sub(1:3)); fprintf('%d \t\t : \t',cust_sub(4));
    ip_bin13 = Decimal2binary(cust_sub);
    fprintf('%s \n',ip_bin13);  fprintf('\n');
    
 %------------- function to calculating parameters using ip,custom address and defalut address
    calculation(ip,cust_sub,def_sub);       
    

 % ----------------  calculation for class C network address ----------------------
 
elseif ip(1)>= 192 && ip(1)<=223 && ip(2)<255  && ip(3)<255  &&  ip(4)<255                                                                                               
    
    def_sub= [255 255 255 0];
    
    if acc ~=1  
        cust_sub= CustomSubnet(def_sub);
    else
        cust2= input(' Please enter Custom subnet mask  :  ','s'); fprintf('\n');
        n = numel(cust2);
        cust_sub= StringToNumber(cust2,n);
    end
    %-------- function, to find custom subnet  
%     cust_sub= CustomSubnet(def_sub);
    
    fprintf('\n Class \t\t\t\t\t\t :   C  \n'); fprintf('\n');
    fprintf(' Network address \t\t\t\t\t :   ');
    
    fprintf('%d.',ip(1:3));  fprintf('%d \t\t : \t',ip(4));
    ip_bin9 = Decimal2binary(ip);           %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin9);  fprintf('\n');
    
    fprintf(' Default subnet mask \t\t\t\t :   255.255.255.0 \t\t : \t');
    ip_bin14 = Decimal2binary(def_sub);
    fprintf('%s \n',ip_bin14);  fprintf('\n');
    
    fprintf(' Custom subnet mask \t\t\t\t :   ');
    fprintf('%d.',cust_sub(1:3)); fprintf('%d \t : \t',cust_sub(4));
    ip_bin15 = Decimal2binary(cust_sub);
    fprintf('%s \n',ip_bin15);  fprintf('\n');
    
%----------- function to calculating parameters using ip,custom address and defalut address
    calculation(ip,cust_sub,def_sub);        
    
    
% ------------  calculation for class D network address ---------------------    

elseif ip(1)>= 224 && ip(1)<=239 && ip(2)<255  && ip(3)<255  &&  ip(4)<255
    
    fprintf(' Class \t\t\t\t\t\t :   D  \n\n');
    
    fprintf(' Network address \t\t\t\t\t:   ');
    fprintf('%d.',ip(1:3));  fprintf('%d \t\t : \t',ip(4));
    
    ip_bin10 = Decimal2binary(ip);          %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin10);
    fprintf(' This  IP address is Reserved for Multicasting. \n');  
    
    
% ----------------  calculation for class E network address ----------------------- 

elseif ip(1)>= 240 && ip(1)<=255 && ip(2)<255  && ip(3)<255  &&  ip(4)<255
    
    fprintf(' Class \t\t\t\t\t\t :   E \n\n')
    
    fprintf(' Network address \t\t\t\t:   ');
    fprintf('%d.',ip(1:3));  fprintf('%d \t\t : \t',ip(4)); 
    
    ip_bin11 = Decimal2binary(ip);          %------- function, to convert decimal value to binary
    fprintf('%s \n',ip_bin11); 
    fprintf(' This IP address is used for Experimental and research only. \n');
    
else

    fprintf(' Invalid Input \n');
    fprintf(' Your input is wrong. Please give valid IP address \n');
    continue;
    
end

    fprintf('\n Do you want to continue this with New IP address \n');
    out1= input(' Enter "Y" for `YES`  or  "N" for `NO`  : ','s') ; fprintf('\n');
    out2= sum(double(out1));        % check entered input correct ot not using ascii value
    if out2== 121 || out2== 89
        continue;
    elseif out2== 110 || out2== 78
        break;
    else
        out1=  input(' Invalid input \n You have only two way : "Y" or "N" \n Please enter valid input : ','s');
        out2= sum(double(out1));
            if out2== 121 || out2== 89      % check entered input correct ot not using ascii value
                continue;
            elseif out2== 110 || out2== 78
                break;
            end  
    end
   break;
   
end

 fprintf('-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n');
 fprintf('  *************************************************** PROGRAM * HAS * TERMINATED *************************************************** \n');
 fprintf(' ----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n');

diary off

fopen('E:\Matlab\bin\IP_CALC\out2.txt','wt');
copyfile('E:\Matlab\bin\IP_CALC\out.txt' , 'E:\Matlab\bin\IP_CALC\out2.txt');
delete('E:\Matlab\bin\IP_CALC\out.txt');


