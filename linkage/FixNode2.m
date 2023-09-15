function s=FixNode2(arg)
Dx=get(gca,'Xlim');
a=Dx(1,2)-Dx(1,1);
R1=a/5*.3;
R2=a/5*.1;
T1=a/5*.1;
T2=a/5*.2;
global numberbeam ground
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
        error('FixNodexy works only for 2-d axes.');
    end
    set(hf,'pointer','crossh','doublebuffer','on',...
        'windowbuttonmotionfcn',...
        'FixNode2 move','windowbuttondownfcn','FixNode2 done');
    figure(hf);
    c=0;
    tf=waitforbuttonpress;
    if~tf
        s=0;
        n1=findobj('tag',strcat('y_cons',num2str(numberbeam)));
        n2=findobj('tag',strcat('x_cons',num2str(numberbeam)));
        n3=findobj('tag',strcat('xy_cons',num2str(ground)));
        if n1~=0
            s=1;
        end
        if n2~=0
            s=2;
        end
        if n3~=0
            node=findobj('tag',strcat('node_slider',...
                num2str(ground)));
            x=get(node,'xdata');
            y=get(node,'ydata');
            k=plot(x,y,'ob');
            set(k,'tag',strcat('xy',num2str(ground)));
            s=0;
        end
    end
elseif strcmp(arg,'move');
    cp=get(gca,'currentpoint');
    xy=cp(1,1:2);

    node=findobj('tag',strcat('node_slider',num2str(ground)));
    x=get(node,'xdata');
    y=get(node,'ydata');
    m=xy(1,1)-x; n=xy(1,2)-y;
    if sqrt(3)/3*abs(m)>abs(n)
        t= rectangle('Position', [x-R2/2,y-R1/2,R2,R1]);
        %t= rectangle('Position',[x-.1,y-.25,.2,.5]);
        %t=text(x-.25,y-.1,'[ ]')
        set(t,'tag',strcat('x_cons',num2str(numberbeam)));
        n=findobj('tag',strcat('y_cons',num2str(numberbeam)));
        delete(n);
        n1=findobj('tag',strcat('xy_cons',num2str(ground)));
        delete(n1);
    elseif sqrt(3)*abs(m)<abs(n)
        n= rectangle('Position', [x-R1/2,y-R2/2,R1,R2]);
        %n= rectangle('Position', [x-.25,y-.1,.5,.2]);
        %n=text(x,y,'[__]')
        set(n,'tag',strcat('y_cons',num2str(numberbeam)));
        n1=findobj('tag',strcat('x_cons',num2str(numberbeam)));
        delete(n1);
        n1=findobj('tag',strcat('xy_cons',num2str(ground)));
        delete(n1);
    else
        v=[x-T1 x x+T1];
        u=[y-T2 y y-T2];
        TRI = delaunay(v,u);
        bahman=triplot(TRI,v,u,'k');
        %v=[x-.15 x x+.15];
        %u=[y-.3 y y-.3];
        %TRI = delaunay(v,u);
        %bahman=triplot(TRI,v,u,'k');
        %bahman=text(v,u,'()');
        set(bahman,'tag',strcat('xy_cons',num2str(ground)));
        n=findobj('tag',strcat('x_cons',num2str(numberbeam)));
        delete(n);
        n=findobj('tag',strcat('y_cons',num2str(numberbeam)));
        delete(n);
    end
elseif strcmp(arg,'done');

    set(gcf,'pointer','arrow','doublebuffer','on',...
        'windowbuttonmotionfcn',...
        '','windowbuttondownfcn','');
end

