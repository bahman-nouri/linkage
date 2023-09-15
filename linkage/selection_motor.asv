function n=selection_motor(arg)
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
    error('mmxy works only for 2-d axes.')
end
xlim=get(gca,'xlim');
ylim=get(gca,'ylim');
xy=[sum(xlim) sum(ylim)]/2;
text('parent',gca,'position',xy,'horizontalalignment','left','verticalalignment','bottom','tag','mmxytext');
set(hf,'pointer','crossh','doublebuffer','on','windowbuttonmotionfcn','selection_motor move','windowbuttondownfcn','selection_motor done');
figure(hf);

tf=waitforbuttonpress;
cp=get(gca,'currentpoint');
        xy=cp(1,1:2);

for t=1:17
    
       h=findobj('tag',strcat('xy',num2str(t)));
x=get(h,'xdata');
y=get(h,'ydata');
d=sqrt((x-xy(1,1))^2+(y-xy(1,2))^2);
if d<=.4
   n=[x,y];

break
else
  n=1;  
end
end
elseif strcmp(arg,'move');
        cp=get(gca,'currentpoint');
        xy=cp(1,1:2);
       
     for t=1:13
         
         h=findobj('tag',strcat('xy',num2str(t)));
        
         x=get( h,'xdata');
         y=get( h,'ydata'); 
         vg=sqrt((x-xy(1,1))^2+(y-xy(1,2))^2);
         if vg<=.3
      
       set(h,'markersize',4,'markeredgecolor','r','markerfacecolor','r');
       
         else
        set(h,'markersize',6,'markeredgecolor','b','markerfacecolor','w');

         end
     end 
     


       
 elseif strcmp(arg,'done')
           ht=findobj(gca,'type','text','tag','mmxytext');
           delete(ht)
           set(gcf,'pointer','arrow','doublebuffer','on','windowbuttonmotionfcn','','windowbuttondownfcn','');
end


