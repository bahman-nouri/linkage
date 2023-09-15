function [C,s]=linkm(A,B,c,l3,ss,type )
%A=[1 1] ebtedaye khate asli
%B=[1 7] entehaye khate asli
%c noghteyi rooye A va B ke mikhahim khte digari rasm savad
%ss zaye khate sanaviya az khate avaliye dar jahate pad saeatgard
%l3=2  toole khate savayiye
%type=agar bashad line rasm nemishavad
x1=A(1,1);
y1=A(1,2);
x2=B(1,1);
y2=B(1,2);
atan(7-1/0);
Dx=x2-x1;
Dy=y2-y1;
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
s=(s+ss)-180;
s=s*pi/180;
x3=x2+l3*cos(s);
y3=y2+l3*sin(s);
C=[x3 y3];
if (nargin<6)
    line([c(1,1) x3],[c(1,2) y3]);
end

