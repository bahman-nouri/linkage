function [x_node,y_node,out,gro]=FixNode1(arg)
Dx=get(gca,'Xlim');
a=(Dx(1,2)-Dx(1,1))/2;
Dv=a/5*.1;
global numberbeam
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
        error('FixNodexy works only for 2-d axes.')
    end
    set(hf,'pointer','crossh','doublebuffer','on',...
        'windowbuttonmotionfcn',...
        'FixNode1 move','windowbuttondownfcn'...
        ,'FixNode1 done')
    figure(hf);
    tf=waitforbuttonpress;
    if~tf
        gro=0;
        for t=1:25
            m=1;
            nn=findobj('tag',num2str(t));
            x1=get( nn,'xdata');
            y1=get( nn,'ydata');
            v=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
            if v<=Dv
                gro=t;
                set(nn,'color','b');
                p=plot(x1,y1);
                set(p,'tag',strcat('node_slider',num2str(gro)));
                out=m;
                x_node=x1;
                y_node=y1;
                break
            end
            m=0;
        end
        out=m;
        if m==0
            errordlg('error you mast click on pivot ','error');
            out=m;
            x_node=0;
            y_node=0;
        end
    end
elseif strcmp(arg,'move');

    cp=get(gca,'currentpoint');
    xy=cp(1,1:2);
    for t=1:20
        nn=findobj('tag',num2str(t));
        x1=get( nn,'xdata');
        y1=get( nn,'ydata');
        v=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
        if v<=Dv
            set(nn,'color','r');
        else
            set(nn,'color','b');
        end
    end
%---------------------------------------------------------------------
elseif strcmp(arg,'done');

    set(gcf,'pointer','arrow','doublebuffer','on',...
        'windowbuttonmotionfcn','','windowbuttondownfcn','')
end

