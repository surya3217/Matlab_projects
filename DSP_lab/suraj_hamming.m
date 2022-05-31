function z= suraj_hamming(y)
for i=1:length(y)
   p(i,1)= xor(y(i,1),xor(y(i,2),y(i,4)));
   p(i,2)= xor(y(i,1),xor(y(i,3),y(i,4)));
   p(i,4)= xor(y(i,2),xor(y(i,3),y(i,4)));
   p(i,3)= y(i,1);
   p(i,5)= y(i,2);
   p(i,6)= y(i,3); 
   p(i,7)= y(i,4);
   
end
z= p;
end
