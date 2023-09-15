function point
% Click the left mouse button to define a point
% Drag the mouse to draw a line to the next point and
% left click again
% Right click the mouse to stop drawing
fig=findobj('Tag','figure1') ;
%figure('WindowButtonDownFcn',@wbdcb)
set(fig,'WindowButtonDownFcn',@wbdcb);
%ah = axes('DrawMode','fast');
ah=get(fig,'currentaxes');
set(gcf,'pointer','cross');
   function wbdcb(src,evnt)
      if strcmp(get(src,'SelectionType'),'normal')       
         [x,y,str] = disp_point(ah);
         hl = line('XData',x,'YData',y,'Marker','.','color','black');
         text(x,y,str,'VerticalAlignment','bottom','color','black');drawnow
         set(src,'WindowButtonDownFcn','')
      elseif strcmp(get(src,'SelectionType'),'alt')
         set(src,'WindowButtonDownFcn','')
         [x,y,str] = disp_point(ah);
         %text(x,y,str,'VerticalAlignment','bottom');drawnow
      end
      function wbmcb(src,evnt)
         [xn,yn,str] = disp_point(ah);
         xdat = [x,xn];
         ydat = [y,yn];
         set(hl,'XData',xdat,'YData',ydat);
      end  
   end
   function [x,y,str] = disp_point(ah)
      cp = get(ah,'CurrentPoint');  
      x = cp(1,1);y = cp(1,2);
      str = ['(',num2str(x,'%0.3g'),', ',num2str(y,'%0.3g'),')'];    
   end
end