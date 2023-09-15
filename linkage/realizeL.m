function [a2]=realizeL(a)
[m,n]=size(a);
ii=0;
p4='';
%ii==for biuld a1
for i=1:n
    ii=ii+1;
    p1=a{1,i};
    [x,y]=size(p1);
    for j=1:y
        token=p1(1,j);
        p2=strcmp(token,'+');
        p3=strcmp(token,'-');
        if p2==0 & p3==0
            p4=strcat(p4,token);
            a2{1,ii}=p4;
        end
        if or(p2==1,p3==1)
            ii=ii+1;
            a2{1,ii}=p4; 
            p4='';
        end
    end
    p4='';
end
a2=selfrealize(a2);
end
        