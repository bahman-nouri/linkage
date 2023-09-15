function out=mmxy(arg)
persistent xy

if nargin==0

hf=get(0,'currentfigure')
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
xy=[sum(xlim) sum(ylim)]/2
text('parent',gca,'position',xy,'horizontalalignment','left','verticalalignment','bottom','tag','mmxytext')
set(hf,'pointer','crossh','doublebuffer','on','windowbuttonmotionfcn','mmxy move','windowbuttondownfcn','mmxy done')
figure(hf)
elseif strcmp(arg,'move');
    
        cp=get(gca,'currentpoint');
        xy=cp(1,1:2);
        ht=findobj(gca,'type','text','tag','mmxytext');
        set(ht,'position',[3,4],'string',sprintf('x=%.2g\ny=%.2g',xy))
 elseif strcmp(arg,'done')
            ht=findobj(gca,'type','text','tag','mmxytext');
            delete(ht)
           

end


