function [rx,ry,tag]=selection_motor1(arg);
global position_motor
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
    error('mmxy works only for 2-d axes.');
end
xlim=get(gca,'xlim');
ylim=get(gca,'ylim');
xy=[sum(xlim) sum(ylim)]/2;
text('parent',gca,'position',xy,'horizontalalignment','left','verticalalignment','bottom','tag','mmxytext');
set(hf,'pointer','crossh','doublebuffer','on','windowbuttonmotionfcn','selection_motor1 move','windowbuttondownfcn','selection_motor1 done');
figure(hf);
tf=waitforbuttonpress;
rx=0;ry=0;tag=0;
        for t=1:7
          h=findobj('color','g');  
         u=isempty(h);
      if u~=1;
        tag=get(h,'tag');
          rx= get(h,'xdata'); 
          ry= get(h,'ydata');
          set(h,'color','b');
        break
      end
        end
   elseif strcmp(arg,'move');
        cp=get(gca,'currentpoint');
        xy=cp(1,1:2);
    for t=1:7
          h=findobj('tag',strcat('beam',num2str(t)));
        u=isempty(h);
      if u~=1;
x=get(h,'xdata');
y=get(h,'ydata');
l1=sqrt((x(1,1)-x(1,2))^2+(y(1,1)-y(1,2))^2);   
  l2= sqrt((x(1,1)-xy(1,1))^2+(y(1,1)-xy(1,2))^2) ;
   l3= sqrt((x(1,2)-xy(1,1))^2+(y(1,2)-xy(1,2))^2) ;
   f=l3+l2-l1;
   if f<=.02
set(h,'color','g');
   else 
   
 set(h,'color','b');
end 
%-----------------------------
end    
end   
    elseif strcmp(arg,'done')
           ht=findobj(gca,'type','text','tag','mmxytext');
           delete(ht)
           set(gcf,'pointer','arrow','doublebuffer','on','windowbuttonmotionfcn','','windowbuttondownfcn','');
end
