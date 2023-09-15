function d=search(a,b)
[m,n]=size(a);
d=0;
for i=1:m
    j=strcmp(a{i,1},b);
    if j==1
        d=1;
    end
end
