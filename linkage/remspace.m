function b=remspace(a,c)
b={'-'};
[m,n]=size(a);
j=0;
for i=1:n
    [x,y]=size(a{i});
    if y~=0
        j=j+1;
        b{1,j}=a{i};
    end
end
if c==2
    [m1,n1]=size(b);
    [m2,n2]=size(a);
    while n2>n1;
        b{1,n1+1}='';
        n1=n1+1;
    end
end
        
    