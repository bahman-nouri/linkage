function m_766(G)
maple('restart')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=3;
%%%AB=AD=d;
%%%%CD=DE=EK=Ck=a
%%%%BC=BE=e
b=a;
d=2;
e=6;
%###################################################
motion=160*pi/180;
time=2;
w=motion/time;
intervals=30;
n=(time)/intervals;
%###################################################
syms x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7 t
%be ezaye har jesmi 3ta poshte sare ham minevisim =q
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3;x4 ;y4 ;t4; x5 ;y5 ;t5 ;x6 ;y6 ;t6; x7; y7; t7];
q0=[-1;0;0;...
    0.165;1.25; 30*pi/180;...
    0.165;-1.25;-30*pi/180;...
    4.49;1.25;-30*pi/180;...
    2.16;1.25;82.4*pi/180;...
    4.49;-1.25;30*pi/180;...
    2.175;-1.23;-82.4*pi/180];
c_qt=[x1+d/2*cos(t1);...
    y1+d/2*sin(t1);...
    %p2
    x1-d/2*cos(t1)-x2+e/2*cos(t2);...
    y1-d/2*sin(t1)-y2+e/2*sin(t2);...
    %p2
    x1-d/2*cos(t1)-x3+e/2*cos(t3);...
    y1-d/2*sin(t1)-y3+e/2*sin(t3);...
    %p6
    x5-b/2*cos(t5)-d;...
    y5-b/2*sin(t5);...
    %p6
    x7-b/2*cos(t7)-d;...
    y7-b/2*sin(t7);...
    %p3
    x5+b/2*cos(t5)-x4+a/2*cos(t4);...
    y5+b/2*sin(t5)-y4+a/2*sin(t4);...
    %p3
    x2+e/2*cos(t2)-x5-b/2*cos(t5);...
    y2+e/2*sin(t2)-y5-b/2*sin(t5);...
    %p4
    x4+a/2*cos(t4)-x6-a/2*cos(t6);...
    y4+a/2*sin(t4)-y6-a/2*sin(t6);...
    %p5
    x6-a/2*cos(t6)-x3-e/2*cos(t3);...
    y6-a/2*sin(t6)-y3-e/2*sin(t3);...
    %p5
    x3+e/2*cos(t3)-x7-b/2*cos(t7);...
    y3+e/2*sin(t3)-y7-b/2*sin(t7);...
    t1-w*t];
cq=inline(jacobian(c_qt,q));
c=inline(c_qt);
m=0;
tic
for t0=(-time/2):n:(time/2)
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
 q0(3,1)=w*t0;
 %c0 bayad sefr shavad
 end

position(:,m)=q0;
linkn(d,q0(1,1),q0(2,1),q0(3,1),'^');
linkn(e,q0(4,1),q0(5,1),q0(6,1),'o','o');
linkn(e,q0(7,1),q0(8,1),q0(9,1));
[p1 p2]=linkn(a,q0(10,1),q0(11,1),q0(12,1),'o');
pivot4X(:,m)=p2(1,1);
pivot4Y(:,m)=p2(1,2);
linkn(a,q0(13,1),q0(14,1),q0(15,1));
linkn(a,q0(16,1),q0(17,1),q0(18,1));
linkn(a,q0(19,1),q0(20,1),q0(21,1),'o','^');
xlim([-3,10])
ylim([-6,7])
%setaxis
pause(n)
% plot(pivot4X(1,:),pivot4Y(1,:),'color','red');
hold off
end
Ttime=toc;
hold on
if G==0
%plot(position(1,:),position(2,:),'color','red');
%plot(position(4,:),position(5,:),'color','red');
%plot(position(7,:),position(8,:),'color','red');
plot(pivot4X(1,:),pivot4Y(1,:),'.','color','red');
elseif G==1
    plot(pivot4X(1,:),pivot4Y(1,:),'color','red');
end
    