function linem2(p1,p2,color,Marker)
%draw line with 2point %startp and endp
h=line([p1(1,1) p2(1,1)],[p1(1,2),p2(1,2)]);
set(h,'color',color);
set(h,'Marker',Marker);
end