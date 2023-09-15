function [c,n]=prismatic_constraint(s,x_node,y_node,n)
global numberbeam numbernode_1 numbernode_2
if s==1
    con(str2num(n),1)={strcat('t',num2str(numberbeam))};
    if y_node>=0
        con(str2num(n)+1,1)={strcat('y',...
            num2str(numberbeam),'-',num2str(y_node))};
    else
        con(str2num(n)+1,1)={strcat('y',...
            num2str(numberbeam),'+',num2str(abs(y_node)))};
    end
    for d=1:str2num(numbernode_2)
        r=findobj('tag',num2str(d));
        x_node2=get(r,'xdata');
        y_node2=get(r,'ydata');
        delta1=x_node2-x_node;
        delta2=y_node2-y_node;
        if delta1==0,delta2==0
            if rem(d, 2) == 0
                r=findobj('tag',num2str(d-1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);
                con(str2num(n)+2,1)={strcat('x',num2str(numberbeam)...
                    ,'-x',num2str(d/2),'-',num2str(l/2),'*cos(t',...
                    num2str(d/2),')')};
                con(str2num(n)+3,1)={strcat('y',num2str(numberbeam),...
                    '-y',num2str(d/2),'-',num2str(l/2),'*sin(t',...
                    num2str(d/2),')')};
                c=con;
                break
            end
            if rem(d, 2) ~= 0
                r=findobj('tag',num2str(d+1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);
                con(str2num(n)+2,1)={strcat('x',num2str(numberbeam),...
                    '-x',num2str((d+1)/2),'+',num2str(l/2),'*cos(t',...
                    num2str((d+1)/2),')')};
                con(str2num(n)+3,1)={strcat('y',num2str(numberbeam),...
                    '-y',num2str((d+1)/2),'+',num2str(l/2),'*sin(t'...
                    ,num2str((d+1)/2),')')};
                c=con;
                %-------------
                break
            end
        end
    end
    n=str2num(n)+4;
end
if s==2
    con(str2num(n),1)={strcat('t',num2str(numberbeam),'-','pi/2')};
    if x_node>=0
        con(str2num(n)+1,1)={strcat('x',num2str(numberbeam)...
            ,'-',num2str(x_node))};
    else
        con(str2num(n)+1,1)={strcat('x',num2str(numberbeam)...
            ,'+',num2str(abs(x_node)))};

    end
    for d=1:str2num(numbernode_2)
        r=findobj('tag',num2str(d));
        r=findobj('tag',num2str(d));

        x_node2=get(r,'xdata');
        y_node2=get(r,'ydata');
        delta1=x_node2-x_node;
        delta2=y_node2-y_node;
        if delta1==0,delta2==0
            if rem(d, 2) == 0
                r=findobj('tag',num2str(d-1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');

                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);
                con(str2num(n)+2,1)={strcat('x',num2str(numberbeam)...
                    ,'-x',num2str(d/2),'-',num2str(l/2),'*cos(t'...
                    ,num2str(d/2),')')};
                con(str2num(n)+3,1)={strcat('y',num2str(numberbeam)...
                    ,'-y',num2str(d/2),'-',num2str(l/2),'*sin(t'...
                    ,num2str(d/2),')')};
                c=con;
                break
            end
            if rem(d, 2) ~= 0
                r=findobj('tag',num2str(d+1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);
                con(str2num(n)+2,1)={strcat('x',num2str(numberbeam)...
                    ,'-x',num2str((d+1)/2),'+',num2str(l/2),'*cos(t'...
                    ,num2str((d+1)/2),')')};
                con(str2num(n)+3,1)={strcat('y',num2str(numberbeam)...
                    ,'-y',num2str((d+1)/2),'+',num2str(l/2),'*sin(t'...
                    ,num2str((d+1)/2),')')};
                c=con;
                break
            end
        end
    end
    n=str2num(n)+4;
end
%---------------------------------------------------------------------
if s==0
    for d=1:str2num(numbernode_2)

        r=findobj('tag',num2str(d));
        x_node2=get(r,'xdata');
        y_node2=get(r,'ydata');
        delta1=x_node2-x_node;
        delta2=y_node2-y_node;
        if and(delta1==0,delta2==0)
            if rem(d, 2) == 0

                r=findobj('tag',num2str(d-1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');

                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);
                %-----------------------------------------------------
                if x_node>=0
                    con(str2num(n),1)={strcat('x',num2str(d/2),'+',...
                        num2str(l/2),'*cos(t',num2str(d/2),')-'...
                        ,num2str(x_node))};
                else
                    con(str2num(n),1)={strcat('x',num2str(d/2),'+'...
                        ,num2str(l/2),'*cos(t',num2str(d/2),')','+'...
                        ,num2str(abs(x_node)))};
                end
                if y_node>=0
                    con(str2num(n)+1,1)={strcat('y',num2str(d/2),'+'...
                        ,num2str(l/2),'*sin(t',num2str(d/2),')-'...
                        ,num2str(y_node))};
                else
                    con(str2num(n)+1,1)={strcat('y',num2str(d/2)...
                        ,'+',num2str(l/2),'*sin(t',num2str(d/2),')'...
                        ,'+',num2str(abs(y_node)))};
                end
                c=con;
                break
            end
            if rem(d, 2) ~= 0
                r=findobj('tag',num2str(d+1));
                x_node3=get(r,'xdata');
                y_node3=get(r,'ydata');
                l=sqrt((x_node3-x_node)^2+ (y_node3-y_node)^2);

                %------------------------
                if x_node>=0
                    con(str2num(n),1)={strcat('x',num2str((d+1)/2),'-'...
                        ,num2str(l/2),'*cos(t',num2str((d+1)/2),')-'...
                        ,num2str(x_node))};
                else
                    con(str2num(n),1)={strcat('x',num2str((d+1)/2),...
                        '-',num2str(l/2),'*cos(t',num2str((d+1)/2),')'...
                        ,'+',num2str(abs(x_node)))};
                end
                if y_node>=0
                    con(str2num(n)+1,1)={strcat('y',num2str((d+1)/2)...
                        ,'-',num2str(l/2),'*sin(t',num2str((d+1)/2)...
                        ,')-',num2str(y_node))};
                else
                    con(str2num(n)+1,1)={strcat('y',num2str((d+1)/2)...
                        ,'-',num2str(l/2),'*sin(t',num2str((d+1)/2)...
                        ,')','+',num2str(abs(y_node)))};
                end
                %--------------------------------------------------
                c=con;
                break
            end
        end
    end
    n=str2num(n)+2;
end