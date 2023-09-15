function c=createspace(a,b)
[m1,n1]=size(a);
[m2,n2]=size(b);
c=a;
c(1,n1+1)=blanks(1);
for i=1:n2
    c(1,n1+i+1)=b(1,i);
end
