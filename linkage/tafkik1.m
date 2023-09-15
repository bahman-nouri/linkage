function strmat=tafkik1(a)
[str,remain]=strtok(a);
strmat{1}=str;
[m,n]=size(remain);
i=1;
while n>0
   [str,remain]=strtok(remain);
   i=i+1;
   strmat{i}=str;
   [m,n]=size(remain);
end

