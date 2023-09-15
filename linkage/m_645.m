function m_645(a,motion,time,intervals)
maple('restart')
%a=4.5;
z1=a;
z2=.49*a;
z3=.51*a;
xp4=-.68*a*cos(pi/4);
yp4=.68*a*sin(pi/4);
theta0=pi;
%###################################################
%motion=-pi/6;
%time=30;
w=motion/time;
%intervals=30;
n=(time)/intervals;
%###################################################
syms x1 y1 t1 x2 y2 t2 x3 y3 t3 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[-a/2;0;theta0;...
    0.202;2;83*pi/180;
    -1.2;2;-3*pi/180];
c_qt=[x1-z1/2*cos(t1);...
    y1-z1/2*sin(t1);...
    x1+z1/2*cos(t1)-x2+z2/2*cos(t2);...
    y1+z1/2*sin(t1)-y2+z2/2*sin(t2);...
    x2+z2/2*cos(t2)-x3+z3/2*cos(t3);...
    y2+z2/2*sin(t2)-y3+z3/2*sin(t3);...
    x3+z3/2*cos(t3)-xp4;...
    y3+z3/2*sin(t3)-yp4;...
    t1-w*t-theta0];
cq=inline(jacobian(c_qt,q));
c=inline(c_qt);
m=0;
for t0=0:n:time
    tic
   m=m+1;
   M_t0(:,m)=t0;
    %p===harche bishtar c0 ra be sefr bishtar be 0 nezdik mikonad
 for p=1:20
 cq0=cq(q0(3,1),q0(6,1),q0(9,1));
 c0=c(t0,...
     q0(3,1),q0(6,1),q0(9,1),...
     q0(1,1),q0(4,1),q0(7,1),...
     q0(2,1),q0(5,1),q0(8,1));
 delta=-1*inv(cq0)*c0;
 q0=q0+delta;
 %motor dar t1 gharar darad.... driver
 q0(3,1)=w*t0+theta0;
 %c0 bayad sefr shavad
 end
position(:,m)=q0;
linkn(z1,q0(1,1),q0(2,1),q0(3,1),'o','^');
[p2 p3]=linkn(z2,q0(4,1),q0(5,1),q0(6,1));
linkm(p2,p3,p3,1.1*a,246.39+90);
linkm(p3,p2,p2,.68*a,49.57+90);
linkn(z3,q0(7,1),q0(8,1),q0(9,1),'^','o');
fig=findobj('Tag','figure1');
set(0,'CurrentFigure',fig);
%ah=get(fig,'currentaxes');
lx=get(gca,'xlim');
ly=get(gca,'ylim');
xlim(lx);
ylim(ly);
setaxis;
Ttime=toc;
hold off
if n>Ttime
    pause(n-Ttime)
else
    pause(.000001)
end
end
