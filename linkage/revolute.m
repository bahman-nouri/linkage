function b=revolute(a);
[m,n]=size(a);
if m>1
    for i=1:m;
    b{1,i}=a{i,1};
    end
end
if m==0
    b{1,1}='';
end
if m==1;
    b{1,1}=a;
end
