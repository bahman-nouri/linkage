function slope1(a,b,c,d)
%--
%a='P2[x]';
%b='P2[y]';
%c=21 or 31
%d=2 or 3
x1=0;
y1=0;
x2=str2num(maple(a));
y2=str2num(maple(b));
Dx=x2-x1;
Dy=y2-y1;
l=sqrt(Dx^2+Dy^2);
maple(strcat('P',c,':=',num2str(l)));
s=atan(Dy/Dx);
s=s*180/pi;
if Dx==0 & Dy>0
    s=90;
end
if and(Dx==0,Dy<0)
    s=-90;
end 
if and(Dy==0,Dx<0)
    s=-180;
end
if and(Dx<0,Dy>0)
    %robe 2
    s=s+180;
elseif and(Dx<0,Dy<0)
    %robe 3
    s=s-180;
end
s=s*pi/180;
maple(strcat('delta',d,':=',num2str(s)));
end