function [s,l]=slope(A,B)
x1=A(1,1);
y1=B(1,1);
x2=A(1,2);
y2=B(1,2);
Dx=x2-x1;
Dy=y2-y1;
l=sqrt(Dx^2+Dy^2);
s=atan(Dy/Dx);
s=s*180/pi;
if Dx==0 & Dy>0
    s=90;
end
if and(Dx==0,Dy<0)
    s=-90;
end
if and(Dx<0,Dy>0)
    %robe 2
    s=s+180;
elseif and(Dx<0,Dy<0)
    %robe 3
    s=s-180;
end
s=s*pi/180;
end
