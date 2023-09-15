function mmgrid(varargin)
ni=nargin;
if ni==0;
    error('')
end
if ~iscellstr(varargin)
    error('')
end
hf=get(0,'currentfigure');
if isempty(hf)
    return
end
ha=get(hf,'currentaxes')
if isempty(ha)
  return
end

v=varargin{1};
idx=strfind('xXyYzZ',v(1));
if isempty(idx)
    error('unkown axis selected')
end
vgrid=[upper(v(1)),'grid'];
if ni==1
    gstate=get(ha,vgrid);
    if strcmpi(gstate,'on')
        set(ha,vgrid,'off')
    else
        set(ha,vgrid,'on')
    end

elseif ni==2
    onoff=varatgin{2};
  if strcmpi(onoff,'on')
        set(ha,vgrid,'on')
  elseif  strcmpi(onoff,'off')
      
        set(ha,vgrid,'off')
  else
      error('second argument must be on or off.')
  end 
elseif ni==3
    if~strcmpi(varargin{3},'minor')
    error('unkown third argument')
end
vgrid=[upper(v(1)),'minogrid'];
onoff=varargin{2};
if strcmpi(onoff,'on')
    set(ha,vgrid,'on')
elseif strcmpi(onoff,'off')
    set(ha,vgrid,'off')    
else
 error('second argument must be on or off.')    
end
end
  
  
    
    
    