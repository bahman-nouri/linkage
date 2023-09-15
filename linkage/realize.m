function [a1,a2,a3]=realize(a)
[m,n]=size(a);
ii=0;
p4='';
it=0;
iit=0;
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
            a1{1,ii}=p4;
        end
        if or(p2==1,p3==1)
            if mod(i,2)==0;
                iit=iit+1;
                a3{1,iit}=p4;
            end 
            p4='';
            ii=ii+1;
        end
     end
    if mod(i,2)==0;
        iit=iit+1;
        a3{1,iit}=p4;
    end 
    p4='';
    if mod(i,2);
        it=it+1;
        a2{1,it}=a{1,i};
    end
end
a1=selfrealize(a1);
a2=selfrealize(a2);
a3=selfrealize(a3);
end
