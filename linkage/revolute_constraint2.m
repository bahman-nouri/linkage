function [c22,n,s1]=revolute_constraint2(n)
%----------------------------------------------------------------------
global numberbeam numbernode_1 numbernode_2
c22='1';
s1=0;
d=findobj('tag',numbernode_2);
x_node1=get(d,'xdata');
y_node1=get(d,'ydata');
for k=1:str2num(numbernode_1)
    r=findobj('tag',num2str(k));
    x_node2=get(r,'xdata');
    y_node2=get(r,'ydata');
    delta1=x_node1-x_node2;
    delta2=y_node1-y_node2;
    if delta1==0& delta2==0
        if str2num(numbernode_1)~=k
 %--------------------------------------------------------------------
            if rem(k, 2) == 0
                r=findobj('tag',numbernode_1);
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                r=findobj('tag',num2str(k-1));
                x_node4=get(r,'xdata');
                y_node4=get(r,'ydata');
                l1=sqrt((x_node3-x_node1)^2+ (y_node3-y_node1)^2);
                l2=sqrt((x_node2-x_node4)^2+ (y_node2-y_node4)^2);
                con1(str2num(n),1)={strcat('x',...
                    num2str(numberbeam),'+',...
                    num2str(l1/2),'*cos(t',....
                    num2str(numberbeam),')-',...
                    'x',num2str(k/2),'-',num2str(l2/2),'*cos(t'...
                    ,num2str(k/2),')')};
                con1(str2num(n)+1,1)={strcat('y',...
                    num2str(numberbeam),...
                    '+',num2str(l1/2),'*sin(t',...
                    num2str(numberbeam),')-',...
                    'y',num2str(k/2),'-',num2str(l2/2),'*sin(t',...
                    num2str(k/2),')')};
                c22=con1;
                n=str2num(n)+2;

                s1=1;
                break
            end
            if rem(k, 2) ~= 0
                r=findobj('tag',numbernode_1);
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                r=findobj('tag',num2str(k+1));
                x_node4=get(r,'xdata');
                y_node4=get(r,'ydata');
                l1=sqrt((x_node3-x_node1)^2+ (y_node3-y_node1)^2);
                l2=sqrt((x_node2-x_node4)^2+ (y_node2-y_node4)^2);
                con1(str2num(n),1)={strcat('x',...
                    num2str(numberbeam),'+'...
                    ,num2str(l1/2),'*cos(t',...
                    num2str(numberbeam),')-',...
                    'x',num2str((k+1)/2),'+',...
                    num2str(l2/2),'*cos(t',...
                    num2str((k+1)/2),')')};
                con1(str2num(n)+1,1)={strcat('y',...
                    num2str(numberbeam),...
                    '+',num2str(l1/2),'*sin(t',...
                    num2str(numberbeam),')-',...
                    'y',num2str((k+1)/2),'+',...
                    num2str(l2/2),'*sin(t',...
                    num2str((k+1)/2),')')};
                c22=con1;
                n=str2num(n)+2;
                s1=1;

                break
            end
 %--------------------------------------------------------------------
        end
    end
end

