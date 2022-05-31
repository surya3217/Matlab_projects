function y=myfunction()
n=0;
for j=1:10
    if d(1,j)<=30
        n=n+1;
    end
end
n
p=zeros(1,n);
q=zeros(1,n);
k=1;
for j=1:10
    if d(1,j)<=30
        p(1,k)=x(1,j);
        q(1,k)=y(1,j);
        k=k+1;
    end
end
p,q
for j=1:n
     subplot(1,2,2); 
     plot([p(1,1),p(1,j)],[q(1,1),q(1,j)],'-o');
     axis([0 100 0 100]);
     hold on; 
end
end

