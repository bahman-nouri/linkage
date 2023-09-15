function [c1 c2]=linkn(l,x,y,t,pivot1,pivot2)
%l=lenght
%x=coordinat vasat
%y=coordinat vasat
%t=slop
%tag=name of beam%%%tag is double
%%% pivot1===bar sare mosbat ast example '^'
%%% pivot2=bar sare manfi ast examle 'o'
if nargin>=4
    x11=x+l/2*cos(t);
    y11=y+l/2*sin(t);
    x22=x-l/2*cos(t);
    y22=y-l/2*sin(t);
    x=[x11 x22];
    y=[y11 y22];
    plot(x,y,'linewidth',1);
end
hold on
if nargin>=5
    plot(x11,y11,pivot1);
end
if nargin==6
    plot(x22,y22,pivot2);
end
%mokhtasate ebteda va enteha
c2=[x11 y11];
%c2 sare roobe roo dasga mokhtasate mahali
c1=[x22 y22];