function [d]= SubnetRange(q)

q = [q(1:8); q(9:16); q(17:24); q(25:32)];
s = transpose(bi2de(q));
fprintf('%d.',s(1:3)); fprintf('%d',s(4));
d= s;

end
