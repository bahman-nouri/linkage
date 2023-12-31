%clc
%clear
%xi1=-59.82*pi/180
%xi2=-8.044*pi/180
%xi3=38.14*pi/180
%R1=4.25
%R2=4.502
%R3=5.213
alpha2=50.7*pi/180
alpha3=91.9*pi/180
C1=R3*cos(alpha2+xi3)-R2*cos(alpha3+xi2)
C2=R3*sin(alpha2+xi3)-R2*sin(alpha3+xi2)
C3=R1*cos(alpha3+xi1)-R3*cos(xi3)
C4=-R1*sin(alpha3+xi1)+R3*sin(xi3)
C5=R1*cos(alpha2+xi1)-R2*cos(xi2)
C6=-R1*sin(alpha2+xi1)+R2*sin(xi2)
A1=-C3^2-C4^2
A2=C3*C6-C4*C5
A3=-C4*C6-C3*C5
A4=C2*C3+C1*C4
A5=C4*C5-C3*C6
A6=C1*C3-C2*C4
k1=A2*A4+A3*A6
k2=A3*A4+A5*A6
k3=(A1^2-A2^2-A3^2-A4^2-A6^2)/2
beta3=2*atan((k2+(k1^2+k2^2-k3^2)^.5)/(k1+k3))
beta2=acos((A5*sin(beta3)+A3*cos(beta3)+A6)/A1)*180/pi
beta2=asin((A3*sin(beta3)+A2*cos(beta3)+A4)/A1)*180/pi
beta3*180/pi