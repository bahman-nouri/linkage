function setaxis
axis auto
dx=get(gca,'Xlim');
dy=get(gca,'Ylim');
%%%%center axis
cx=dx(1,1)+((dx(1,2)-dx(1,1))/2);
cy=dy(1,1)+((dy(1,2)-dy(1,1))/2);
%%%biger lentgh
Dx=dx(1,2)-dx(1,1);
Dy=dy(1,2)-dy(1,1);
if Dy>=Dx
    set(gca,'Xlim',[cx-Dy/2 cx+Dy/2]);
else
    set(gca,'Ylim',[cy-Dx/2 cy+Dx/2]);
end
end