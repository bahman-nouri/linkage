function drawresult(a,b,c)
[m,n]=size(a);
startpoint=[b c];
MP(1,1)=b;
Mp(1,2)=c;
j=1;
for i=1:2:(n)
    length=str2num(maple(a{1,i}));
    tetha=str2num(maple(a{1,i+1}));
    Xendpoint=startpoint(1,1)+length*cos(tetha);
    yendpoint=startpoint(1,2)+length*sin(tetha);
    if mod(i,2)~=0
        MP(j,1)=Xendpoint;
        MP(j,2)=yendpoint;
        j=j+1;
    end
    %%%%%create line with tag
    %h1=line([startpoint(1,1) Xendpoint],[startpoint(1,2)
    %yendpoint],'color','black' )
    %text((startpoint(1,1)+Xendpoint)/2,(startpoint(1,2)+yendpoint)/2,a{1,i});
    %set(h1,'Marker','o');
    axis([0 5 0 5]);
    hline = imdistline(gca,[startpoint(1,1),Xendpoint],[startpoint(1,2),yendpoint]);
    api = iptgetapi(hline);
    api.setLabelTextFormatter(a{1,i});
    startpoint=[Xendpoint yendpoint];
    hold on
end
%axis([0 5 0 5]);
%h=impoly(gca,MP);
%setColor(h,'green')