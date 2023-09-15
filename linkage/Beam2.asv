function [s,l,center]=Beam2(arg)

global numberbeam numbernode_1 numbernode_2
persistent xy
if nargin==0
    hf=get(0,'currentfigure');
    if isempty(hf)
        return
    end
    ha=get(hf,'currentaxes');
    if isempty(ha)
        return
    end
    v=get(gca,'view');
    if any(v~=[0,90])
        error('nnxy works only for 2-d axes.');
    end
    xlim=get(gca,'xlim');
    ylim=get(gca,'ylim');
    xy=[sum(xlim) sum(ylim)]/2;
    set(hf,'pointer','crossh','doublebuffer','on',...
        'windowbuttonmotionfcn','Beam2 move','windowbuttondownfcn'...
        ,'Beam2 done');
    tf=waitforbuttonpress;
    if~tf
        for t=1:20
            m=findobj('tag',num2str(t));
            x1=get( m,'xdata');
            y1=get( m,'ydata');
            d_center=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
            if  d_center<=.2
                n= findobj('tag',num2str(numbernode_2));
                set(n,'xdata',x1);
                set(n,'ydata',y1);
                u=findobj('tag',strcat('beam',num2str(numberbeam)));
                node1= findobj('tag',num2str(numbernode_1));
                nx=get(node1,'xdata');
                ny=get(node1,'ydata');
                delete(u)
                x_n=[nx,x1];y_n=[ny,y1];
                bb=plot(x_n,y_n);
                set(bb,'tag',strcat('beam',num2str(numberbeam)));
                [s,l]=slope(x_n,y_n);
                center=[(x_n(1,1)+x_n(1,2))/2,(y_n(1,1)+y_n(1,2))/2 ];
            end
        end
    end
    figure(hf);
elseif strcmp(arg,'move');
%--------------------------------------------------------------------
    cp=get(gca,'currentpoint');
    xy=cp(1,1:2);
    ht=findobj(gca,'type','text','tag','mmxytext');
    set(ht,'position',xy,'string',sprintf('x=%.2g\ny=%.2g',xy));
    hold on
    for t=1:20
        n=findobj('tag',num2str(t));
        x1=get( n,'xdata');
        y1=get( n,'ydata');
        v=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
        if v<=.2
            set(n,'color','r');
        else
            set(n,'color','b');
        end
    end
    hold on
    u=findobj('tag',strcat('beam',num2str(numberbeam)));
    delete(u);
    node1= findobj('tag',num2str(numbernode_1));
    nx=get(node1,'xdata');
    ny=get(node1,'ydata');
    node2= findobj('tag',num2str(numbernode_2));
    delete(node2);
    x_n=[nx,xy(1,1)];y_n=[ny,xy(1,2)];
    bb=plot(x_n,y_n);

    set(bb,'tag',strcat('beam',num2str(numberbeam)));
    n2= plot(xy(1,1),xy(1,2),'ob');
    set(n2,'tag',num2str(numbernode_2));
 %------------------------------------------------------------------
elseif strcmp(arg,'done');
    set(gcf,'pointer','arrow','doublebuffer','on',...
        'windowbuttonmotionfcn'...
        ,'','windowbuttondownfcn','');
end

