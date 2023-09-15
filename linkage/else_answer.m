function [startp,commonp,endp,betweenp]=else_answer(A,B,C,D)
%A=xlim  line1
%B=ylim  line1
%C=xlim  line2
%D=ylim  line2
%
%find point
p1=[A(1,1) B(1,1)];
p2=[A(1,2) B(1,2)];
p3=[C(1,1) D(1,1)];
p4=[C(1,2) D(1,2)];
%distance
d_p1p3=sqrt((p1(1,1)-p3(1,1))^2+(p1(1,2)-p3(1,2))^2);
d_p1p4=sqrt((p1(1,1)-p4(1,1))^2+(p1(1,2)-p4(1,2))^2);
d_p2p3=sqrt((p2(1,1)-p3(1,1))^2+(p2(1,2)-p3(1,2))^2);
d_p2p4=sqrt((p2(1,1)-p4(1,1))^2+(p2(1,2)-p3(1,2))^2);
mat=[d_p1p3,d_p1p4,d_p2p3,d_p2p4];
find=min(mat);
if d_p1p3==find
    startp=p2;
    commonp=p1;
    endp=p4;
end
if d_p1p4==find
    startp=p2;
    commonp=p4;
    endp=p3;
end
if d_p2p3==find
    startp=p4;
    commonp=p2;
    endp=p1;
end
if d_p2p4==find
    startp=p1;
    commonp=p2;
    endp=p3;
end
betweenp=[(startp(1,1)+endp(1,1))/2,(startp(1,2)+endp(1,2))/2];
