function out=findbeam(arg);
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
text('parent',gca,'position',xy,'horizontalalignment','left','verticalalignment','bottom','tag','mmxytext')
set(hf,'pointer','crossh','doublebuffer','on','windowbuttonmotionfcn','findbeam move','windowbuttondownfcn','findbeam done')
figure(hf);

waitforbuttonpress





   for t=1:17
         h=findobj('tag',strcat('beam',num2str(t)));
         u=isempty(h);
      if u~=1;
         n=findobj('tag',num2str(2*t));
         x1=get( n,'xdata');
         y1=get( n,'ydata');
         n=findobj('tag',num2str(2*t-1));
         x2=get( n,'xdata');
         y2=get( n,'ydata');
         l=sqrt((x1-x2)^2+(y1-y2)^2);
         l1=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
         l2=sqrt((x2-xy(1,1))^2+(y2-xy(1,2))^2);
         v=l1+l2-l;
         if v<=.1,v>=-.1
          set(h,'color','k');
       
           break 
        end
     end 
     end
out=t
elseif strcmp(arg,'move');
        cp=get(gca,'currentpoint');
        xy=cp(1,1:2);
       
     for t=1:5
         h=findobj('tag',strcat('beam',num2str(t)));
         u=isempty(h);
      if u~=1;
         n=findobj('tag',num2str(2*t));
         x1=get( n,'xdata');
         y1=get( n,'ydata');
         n=findobj('tag',num2str(2*t-1));
         x2=get( n,'xdata');
         y2=get( n,'ydata');
         l=sqrt((x1-x2)^2+(y1-y2)^2);
         l1=sqrt((x1-xy(1,1))^2+(y1-xy(1,2))^2);
         l2=sqrt((x2-xy(1,1))^2+(y2-xy(1,2))^2);
         v=l1+l2-l;
         if v>=.1,v<=-.1
          set(h,'color','k');
           else
           set(h,'color','r');  
        end
     end 
     end
       
 elseif strcmp(arg,'done')
           ht=findobj(gca,'type','text','tag','mmxytext');
           delete(ht)

           set(gcf,'pointer','arrow','doublebuffer','on','windowbuttonmotionfcn','','windowbuttondownfcn','')
end


