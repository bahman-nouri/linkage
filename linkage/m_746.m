function m_746
a=1;
z1=11.4*a;
z2=3.6*a;
z3=3.4*a;
z4=5.2*a;
%%%%%under angle can change
dx1=11*a*cos(-109*pi/180);
dy1=11*a*sin(-109*pi/180);
dx2=6*a*cos(-pi/3);
dy2=6*a*sin(-pi/3);
n=5.85*a/2-(5.85*a-4.3*a);
theta0=-pi/2;
w=pi/3;
syms x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3;x4 ;y4 ;t4; x5 ;y5 ;t5];
q0=[-3.6;-4.6;pi/2;...
    -1;-1;0;...
    5;-.5;pi/6;...
    5.85;-1;-pi/2;...
    0;-.5;-pi/2];
c_qt=[x1-z1/2*cos(t1)-dx1;...
    y1-z1/2*sin(t1)-dy1;...
    %%%pivot2
    x1+z1/2*cos(t1)-x2+z2/2*cos(t2);...
    y1+z1/2*sin(t1)-y2+z2/2*sin(t2);...
    %%%%pivot3
    x2+z2/2*cos(t2)-x3+z3/2*cos(t3);...
    y2+z2/2*sin(t2)-y3+z3/2*sin(t3);...
    %%%%pivot4
    x3-n/2*cos(t3)-x5-a/2*cos(t5);...
    y3-n/2*sin(t3)-y5-a/2*sin(t5);...
    %%%%%pivot5
    x3+z3/2*cos(t3)-x4+z4/2*cos(t4);...
    y3+z3/2*sin(t3)-y4+z4/2*sin(t4);...
    %%%%pivot6
    x4+z4/2*cos(t4)-dx2;...
    y4+z4/2*sin(t4)-dy2;...
    %%%%pivot7
    x5-a/2*cos(t5);...
    y5-a/2*sin(t5);...
    %%%%motor for link 5
    t5-w*t-theta0];
cq=inline(jacobian(c_qt,q));
c=inline(c_qt);
for k=1:100
    t0=k/10;
    %p===harche bishtar c0 ra be sefr bishtar be 0 nezdik mikonad
 for p=1:5
 cq0=cq(q0(3,1),q0(6,1),q0(9,1),q0(12,1),q0(15,1));
 c0=c(t0,...
     q0(3,1),q0(6,1),q0(9,1),q0(12,1),q0(15,1),...
     q0(1,1),q0(4,1),q0(7,1),q0(10,1),q0(13,1),...
     q0(2,1),q0(5,1),q0(8,1),q0(11,1),q0(14,1));
 delta=-1*inv(cq0)*c0;
 q0=q0+delta;
 %motor dar t5 gharar darad.... driver
 q0(15,1)=w*t0+theta0;
 %c0 bayad sefr shavad
 end
linkn(z1,q0(1,1),q0(2,1),q0(3,1),'o','^');
linkn(z2,q0(4,1),q0(5,1),q0(6,1),'o','o');
linkn(z3,q0(7,1),q0(8,1),q0(9,1),'o');
linkn(z4,q0(10,1),q0(11,1),q0(12,1),'^');
linkn(a,q0(13,1),q0(14,1),q0(15,1),'o','^');
xlim([-8,4])
ylim([-12,4])
hold off
er=k+50;
P(er) = getframe;
hold off
end
