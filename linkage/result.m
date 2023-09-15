function s6=result(a,m)
%a=motaghayeri dra matlab important
%a=maple('s:=fsolve({f11,f22})')
%m=tedad motadheraye hal shode
a2=findstr(a,'{');
[x,y]=size(a2);
if y==1;
for i=1:(m);
    s1='op(';
    s2=',stringofzequation)';
    s3=num2str(i);
    %sakhte dasture op dar maple
    s4=strcat(s1,s3,s2);
    s5=maple(s4);
    cmp=0;
    parameter='';
    value='';
    if cmp==0;
    [para,remain]=strtok(s5);
    [token,value]=strtok(remain);
    cmp=strcmp(token,'=');
    parameter=strcat(parameter,para);
    s5=value;
    end
    format short;
    value=str2num(value);
    svalue=num2str(value);
    %baraye namayeshe dar matlab
    M=createspace('=',svalue);
    s6{i,1}=createspace(parameter,M); 
    %vared kardane motagheyar dar maple
    mpara{i,1}=strcat(parameter,':','=',svalue);
end
for j=1:(m);
    maple(mpara{j,1});
end
end
if y~=1
    s6={'imposible'};
end
    