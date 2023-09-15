function m_711(a,m,n,motion,time,intervals)
maple('restart')
%a=2;
%m=2.5;
%n=3;
%%%%%%%
z1=a;
z2=n*a;
%%% 3 ekhtiari
z3=a;
xp4=n*a;
yp4=0;
theta0=pi/2;
%###################################################
%motion=4*pi;
%time=5;
w=motion/time;
%intervals=90;
n=(time)/intervals;
%###################################################syms x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3; x4;y4;t4;x5;y5;t5;x6;y6;t6;x7;y7;t7];
q0=[1;0;90*theta0;...
    2.5;2;0*pi/180;...
    5;1;90*pi/180;...
    4;2.5;90*pi/180;...
    4;5;60*pi/180;...
    10.5;7.8;0;...
    9;5;60*pi/180
    ];
c_qt=[x1-z1/2*cos(t1);...
    y1-z1/2*sin(t1);...
    %%%%%p2
    x1+z1/2*cos(t1)-x5+5*z1/2*cos(t5);...
    y1+z1/2*sin(t1)-y5+5*z1/2*sin(t5);...
    %%%p2
    x2-n*z1/2*cos(t2)-x5+5*z1/2*cos(t5);...
    y2-n*z1/2*sin(t2)-y5+5*z1/2*sin(t5);...
    %%%%%p5
    x2+n*z1/2*cos(t2)-x3+z3/2*cos(t3);...
    y2+n*z1/2*sin(t2)-y3+z3/2*sin(t3);...
    %%%%p5
    x2+n*z1/2*cos(t2)-x7+5*z1/2*cos(t7);...
    y2+n*z1/2*sin(t2)-y7+5*z1/2*sin(t7);...
    %%%%%p4
    x3+z3/2*cos(t3)-n*a;...
    y3+z3/2*sin(t3)-yp4;...
    %%%p3
    x4-2.5*z1/2*cos(t4)-2*z1;...
    y4-2.5*z1/2*sin(t4);...
    %%%%p6
    x5-x4-2.5*z1/2*cos(t4);...
    y5-y4-2.5*z1/2*sin(t4);...
    %%%%p7
    x5+5*z1/2*cos(t5)-x6+n*z1/2*cos(t6);...
    y5+5*z1/2*sin(t5)-y6+n*z1/2*sin(t6);...
    %%%%p8
    x6+n*z1/2*cos(t6)-x7-5*z1/2*cos(t7);...
    y6+n*z1/2*sin(t6)-y7-5*z1/2*sin(t7);...
    %%%motor
    t1-w*t-theta0];
cq=inline(jacobian(c_qt,q));
c=inline(c_qt);
m=0;
for t0=0:n:time
       tic
   m=m+1;
   M_t0(:,m)=t0;
    %p===harche bishtar c0 ra be sefr bishtar be 0 nezdik mikonad
 for p=1:10
 cq0=cq(q0(3,1),q0(6,1),q0(9,1),q0(12,1),q0(15,1),q0(18,1),q0(21,1));
 c0=c(t0,...
     q0(3,1),q0(6,1),q0(9,1),q0(12,1),q0(15,1),q0(18,1),q0(21,1),...
     q0(1,1),q0(4,1),q0(7,1),q0(10,1),q0(13,1),q0(16,1),q0(19,1),...
     q0(2,1),q0(5,1),q0(8,1),q0(11,1),q0(14,1),q0(17,1),q0(20,1));
 delta=-1*inv(cq0)*c0;
 q0=q0+delta;
 %motor dar t1 gharar darad.... driver
 q0(3,1)=w*t0+theta0;
 %c0 bayad sefr shavad
 end
position(:,m)=q0;
linkn(z1,q0(1,1),q0(2,1),q0(3,1),'o','^');
linkn(z2,q0(4,1),q0(5,1),q0(6,1));
linkn(z3,q0(7,1),q0(8,1),q0(9,1),'^','o');
linkn(2.5*z1,q0(10,1),q0(11,1),q0(12,1),'o','^');
linkn(5*z1,q0(13,1),q0(14,1),q0(15,1));
linkn(n*z1,q0(16,1),q0(17,1),q0(18,1),'o','o');
linkn(5*z1,q0(19,1),q0(20,1),q0(21,1));
setaxis;
hold off
Ttime=toc;
hold off
if n>Ttime
    pause(n-Ttime)
else
    pause(.0001)
end
end