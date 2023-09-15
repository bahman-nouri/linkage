function c=selfrealize(a)
c{1,1}=a{1,1};
[m,n]=size(a);
for i=1:n;
    b{1,1}=a{1,i};
    c=stick(c,b);
end