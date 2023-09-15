function []=position(q0,m)
for t=0:10
for d=1:m
    h=findobj('tag',strcat('beam',num2str(m)));
    u=isempty(h);
    %----------------------------------------------------------------------
    if u==0
      
         r=findobj('tag',num2str(2*d));
   x_node1=get(r,'xdata');
   y_node1=get(r,'ydata');
        r=findobj('tag',num2str(2*d-1));
   x_node2=get(r,'xdata');
   y_node2=get(r,'ydata');
   
    length=sqrt((x_node2-x_node1)^2+ (y_node2-y_node1)^2);
    
    node1_x=q0(3*m-2,t)+length/2*cos(q0(3*m,t));
    node1_y=q0(3*m-1,t)+length/2*sin(q0(3*m,t));
    node2_x=q0(3*m-2,t)-length/2*cos(q0(3*m,t));
    node2_y=q0(3*m-2,t)-length/2*sin(q0(3*m,t));

    end
    %----------------------------------------------------------------------
 h=findobj('tag',strcat('y_cons',num2str(m)));
    u=isempty(h);
     if u==0
         
 
         
     end   
    %----------------------------------------------------------------------
    
     h=findobj('tag',strcat('x_cons',num2str(m)));
    u=isempty(h);
     if u==0
         
 

         
     end   
    %----------------------------------------------------------------------
  
end
end




