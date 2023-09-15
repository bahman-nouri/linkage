function [namefun]=zequ(a)
%input should have this form
%for example:
%a={'z1,'theta1','z2','theta2'}
[a1,a2,a3]=realize(a);
a1=remspace(a1,1);
[m,n]=size(a);
for i=1:2:n;
    Z=strcat('(',a{i},')');
    s1=strcat(Z,'*');
    s2=strcat(s1,'sin(',a{i+1},')');
    s3=strcat(s1,'cos(',a{i+1},')');
    if  i==1;
        s4{i}=strcat(s2,'+');
        s5{i}=strcat(s3,'+');
    end
    if i>1 & i<(n);
        s4{i}=strcat(s4{i-2},s2,'+');
        s5{i}=strcat(s5{i-2},s3,'+');
    end
    if i==(n-1);
        s4{i}=strcat(s4{i-2},s2,'=0');
        s5{i}=strcat(s5{i-2},s3,'=0');
    end
end
st='';
%st=== all parameter (z1 ,beta)
[x,y]=size(a1);
for i=1:(y)
    if i==1
       st=strcat('(',a1{i},',');
    end
    if i>1 & i<(y)
       st=strcat(st,a1{i},',');
    end
    if i==(y)
        st=strcat(st,a1{i},')');
    end
end
%string1&2 === give me equation 
string1=s4{n-1};
string2=s5{n-1};
..................................................
%f1maple=strcat('f',num2str(b-1));
%f2maple=strcat('f',num2str(b));
.............................
%smaple=strcat('f',num2str(b-1),':=',st,'->',string1);
%cmaple=strcat('f',num2str(b),':=',st,'->',string2);
stt1=strcat('->',string1);
stt2=strcat('->',string2);
sf=createspace(st,stt1);
cf=createspace(st,stt2);
%fun1=maple(smaple);
%fun2=maple(cmaple);
namefun={sf;cf};
%figure('position',[400 300 520 300],'MenuBar','none','Color','white');
% u = uicontrol('style','listbox','string',namefun,'position',[10 200 500 50]);
%lengh parameter =Lpara
for i=1:(n/2)
    Lpara{i}=a{2*i-1};
end
%angle parameter = Apara
for i=1:(n/2)
  Apara{i}=a{2*i};
end
%u1 = uicontrol('style','listbox','string',Lpara,'position',[10 120 70 70]);
%u2 = uicontrol('style','listbox','string',Apara,'position',[90 120 70 70]);