function h= stages (z,n1,n2)
  t=ceil((n2-n1)/2);
  q=n2-n1+1;
for i=n1:n2
    if i<n1+t
        h(i)=z(i)+z(i+t);
    else
        h(i)=(-z(i)+z(i-t)).*exp(-j*((2.*pi/q)*(i-t-n1)));
    end
  end
end
