function m_651(G)
maple('restart')
a=2;
z1=a;
z2=2.5*a;
z3=2.5*a;
xp4=2*a*cos(0);
yp4=2*a*sin(0);
theta0=2*pi/3;
%###################################################
motion=2*pi;
time=10;
w=motion/time;
intervals=30;
n=(time)/intervals;
%###################################################
syms x1 y1 t1 x2 y2 t2 x3 y3 t3 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[a*cos(theta0);a*sin(theta0);theta0;...
    0.202;2;38*pi/180;
    -1.2;2;-77*pi/180];
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
tic
for t0=0:n:time
    tic
   %p===harche bishtar c0 ra be sefr bishtar be 0 nezdik mikonad
   m=m+1;
   M_t0(:,m)=t0;
 for p=1:5
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
[E]=linkm(p2,p3,p3,2.17*a,180);
EX(:,m)=E(1,1);
EY(:,m)=E(1,2);
linkn(z3,q0(7,1),q0(8,1),q0(9,1),'^','o');
xlim([-7,8]);
ylim([-4,11]);
hold off
Ttime=toc;
if n>Ttime
    pause(n-Ttime)
else
    pause(.0001)
end
end
hold on
if G==0
%plot(position(1,:),position(2,:),'color','red');
%plot(position(4,:),position(5,:),'color','red');
%plot(position(7,:),position(8,:),'color','red');
plot(EX(1,:),EY(1,:),'.','color','red');
elseif G==1
    plot(EX(1,:),EY(1,:),'color','red');
end
    
