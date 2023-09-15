 clear
  clc
  
syms x1 x2 x3 x4 x5 x6 x7
 syms y1 y2 y3 y4 y5 y6 y7
 syms t1 t2 t3 t4 t5 t6 t7 t
 q=[x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7];
q0=zeros(21,1);
%--------------------------------------------------------------------------
c={'x2-1.4838*cos(t2)-x1-0.45988*cos(t1)'
    'y2-1.4838*sin(t2)-y1-0.45988*sin(t1)'
    'x3-1.0985*cos(t3)-x2-1.4838*cos(t2)'
    'y3-1.0985*sin(t3)-y2-1.4838*sin(t2)'
    'x4-1.0873*cos(t4)-x3-1.0985*cos(t3)'
    'y4-1.0873*sin(t4)-y3-1.0985*sin(t3)'
    'x5-1.5301*cos(t5)-x4-1.0873*cos(t4)'
    'y5-1.5301*sin(t5)-y4-1.0873*sin(t4)'
    'x5+1.5301*cos(t5)-x1-0.45988*cos(t1)'
    'y5+1.5301*sin(t5)-y1-0.45988*sin(t1)'
    'x6+0.64549*cos(t6)-x2-1.4838*cos(t2)'
    'y6+0.64549*sin(t6)-y2-1.4838*sin(t2)'
    'x7-0.71888*cos(t7)-x6+0.64549*cos(t6)'
    'y7-0.71888*sin(t7)-y6+0.64549*sin(t6)'
    'x7+0.71888*cos(t7)-x4-1.0873*cos(t4)'
    'y7+0.71888*sin(t7)-y4-1.0873*sin(t4)'
    'x6-0.64549*cos(t6)+2.2114'
    'y6-0.64549*sin(t6)-0.45553'
    'x1-0.45988*cos(t1)+1.1155'
    't5-t1'
    't1-.62832*t'};

for t=1:21
   cq{t,1} =inline(jacobian(char(c(t,1)),q));
end

tic
for i=1:21
gh= cq{i,1};
xy=c{i,1};
[n,u]=size(xy);
andis=zeros(1,2);
d=0;
 k=1;
for s=1:u 
    p1=isequal(xy(s),'s'); 
    p2=isequal(xy(s),'c');
  
   
    if p1==1|p2==1
         %-------------------------    
   for s=1:u-1     
   r=isequal(xy(s),'t');
    if r==1
andis(1,k)=str2num(xy(s+1));
 
      k=k+1;
      d=d+1 ;
    end
   end 
 if d==1
  cq1=gh(q0(3*andis(1,1)));
  for j=1:21
      cq0(i,j)=cq1(1,j);
  end
  elseif d==2
  cq1=gh(q0(3*andis(1,1)),q0(3*andis(1,2)));
   for j=1:21
      cq0(i,j)=cq1(1,j);
  end
 end
  %-------------------
 
       break
   
    end
  
end
 if p1==0&p2==0
       cq1=gh(0);
        for j=1:21
      cq0(i,j)=cq1(1,j);
  end
  end
end
  toc
%display(cq0)
  