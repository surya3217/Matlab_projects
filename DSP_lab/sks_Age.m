
% Suraj Kumar Saini
% ID - 2015KUEC2015
% Program to find age 

clc
clear all
close all

fprintf('Today date : ');
x = fix(clock);
y = x(1:3)
fprintf('Date of birth : ');
z = [1996 8 16]
% z = input('Enter birth date in [yyyy mm dd] format : ');
a = y - z ;
if a(2)< 0 
    year = a(1) - 1;
    month = 12 - abs(a(2));
else 
    year = a(1);
    month = a(2);
    
end
leap = floor(a(1) / 4);
if a(3)< 0
    day = 30 - abs(a(3)) + leap;
else
    day = a(3) + leap;
end
fprintf('Age : %d years, %d months and %d days \n',year,month,day); 
