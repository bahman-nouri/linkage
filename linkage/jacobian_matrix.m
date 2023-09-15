function [cellstring]=jacobian_matrix(const,u);
%[u,v]=size(const);
for i=1:u
c=const{i,1};
[n,m]=size(c);
for h=1:u/3


%--------------------------------------------------------------------------

for k=2:m-1
  cellstring(i,3*h-2)={'0'};
    tf=isequal(c(k:k+1),strcat('x',num2str(h)));
    if tf==1
          t=isequal(c(k-1),'+');
        if t==1
          cellstring(i,3*h-2)={'+1'};
        end
        t=isequal(c(k-1),'-');
        if t==1
           cellstring(i,3*h-2)={'-1'};
        end
         break
    end
end

%--------------------------------------------------------------------------
for k=2:m-1
    cellstring(i,3*h-1)={'0'};
    tf=isequal(c(k:k+1),strcat('y',num2str(h)));
    if tf==1
          t=isequal(c(k-1),'+');
        if t==1
           cellstring(i,3*h-1)={'+1'};
        end
        t=isequal(c(k-1),'-');
        if t==1
           cellstring(i,3*h-1)={'-1'};
        end
         break
    end
end
 %-------------------------------------------------------------------------
  cellstring(i,3*h)={'0'};
for k=2:m-1
   
    r=isequal(c(2:3),strcat('t',num2str(h)));
    if r==1
        cellstring(i,3*h)={'+1'};
       break
    end
    tf=isequal(c(k:k+1),strcat('t',num2str(h)));
    if tf==1
       for j=k:-1:1
             tf1=isequal(c(j),'+');
             tf2=isequal(c(j),'-');
             if tf1==1
                cos=isequal(c(k-4:k-2),'cos');
                sin=isequal(c(k-4:k-2),'sin');
                if cos==1
               
                 cellstring{i,3*h}=  strcat('-',c(j+1:k-5),'sin(','t',num2str(h),')');
                end
             if sin==1
            
                   cellstring{i,3*h,1}= strcat('+',c(j+1:k-5),'cos(','t',num2str(h),')');
                end
             break
             end
                if tf2==1
                cos=isequal(c(k-4:k-2),'cos');
                sin=isequal(c(k-4:k-2),'sin'); 
                if cos==1
                
                     cellstring{i,3*h}=strcat('+',c(j+1:k-5),'sin(','t',num2str(h),')');
                   
                end
             if sin==1
                
               cellstring{i,3*h}=strcat('-',c(j+1:k-5),'cos(','t',num2str(h),')');
                end
             break
             end 
         end
    end
end
end
end
