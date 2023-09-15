function [cq0]=putvalue(q0,cellstring,m);

for i=1:m
for j=1:m
xy=cellstring{i,j};
[n,u]=size(xy);
h=1;
for s=1:u  
  r=isequal(xy(s),'t');
  if r==1
   h=inline(cellstring{i,j});
   e=str2num(xy(s+1))*3;
   
    cq0(i,j)=h(q0(e));
    h=0;
      break
  end
end
  if h==1
    cq0(i,j)=str2num(xy); 
  end      
end
end 