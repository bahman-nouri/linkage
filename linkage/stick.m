function [c]=stick(a,b)
[m1,n1]=size(a);
[m2,n2]=size(b);
nn=0;
find=0;
c={};
if n1>0
for i=1:n1;
    choose=a{1,i};
    [x,y]=size(c);
    for j=1:y
        d=strcmp(choose,c{1,j});
        if d==1;
           find=1;
        end
    end
    if find==0;
        nn=nn+1;
        c{1,nn}=choose;
    end
    find=0;
end
end
find=0;
if n2>0
for i=1:n2;
    choose=b{1,i};
    [x,y]=size(c);
    for j=1:y
        d=strcmp(choose,c{1,j});
        if d==1;
           find=1;
        end
    end
    if find==0;
        nn=nn+1;
        c{1,nn}=choose;
    end
    find=0;
end
end