function m_684(G)
maple('restart');
a=1;
z1=a;
z2=7.3529*a;
z3=7.3529*a;
xp4=1.41*z2*cos(pi/3);
yp4=1.41*z2*sin(pi/3);
theta0=pi/6;
%###################################################
motion=2*pi;
time=5;
w=motion/time;
intervals=90;
n=(time)/intervals;
%###################################################
syms x1 y1 t1 x2 y2 t2 x3 y3 t3 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[a*cos(theta0);a*sin(theta0);theta0;...
    0.202;2;13*pi/180;
    -1.2;2;112*pi/180];
c_qt=[x1-z1/2*cos(t1);...
    y1-z1/2*sin(t1);...
    x1+z1/2*cos(t1)-x2+z2/2*cos(t2);...
    y1+z1/2*sin(t1)-y2+z2/2*sin(t2);...
    x2+z2/2*cos(t2)-x3+z3/2*cos(t3);...
    y2+z2/2*sin(t2)-y3+z3/2*sin(t3);...
    x3+z3/2*cos(t3)-xp4;...
    y3+z3/2*sin(t3)-yp4;...
    t1-w*t-theta0];
m=0;
cq=inline(jacobian(c_qt,q));
c=inline(c_qt);
tic
for t0=0:n:time
   m=m+1;
   M_t0(:,m)=t0;
    %p===harche bishtar c0 ra be sefr bishtar be 0 nezdik mikonad
 for p=1:10
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
[M]=linkm(p2,p3,p3,7.3529*a,180);
MX(:,m)=M(1,1);
MY(:,m)=M(1,2);
linkn(z3,q0(7,1),q0(8,1),q0(9,1),'^','o');
xlim([-2,18]);
ylim([-2,18]);
hold off
pause(n)
end
Ttime=toc;
hold on
if G==0;
%plot(position(1,:),position(2,:),'color','red');
%plot(position(4,:),position(5,:),'color','red');
%plot(position(7,:),position(8,:),'color','red');
plot(MX(1,:),MY(1,:),'.','color','red');
elseif G==1
    plot(MX(1,:),MY(1,:),'color','red');
end