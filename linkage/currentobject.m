function [show]=currentobject(type)
%this function set gco for user
%type is string input and is type of object
%that user want find
k=waitforbuttonpress;
if k==0
    cobj=get(gcf,'CurrentObject');
    if isempty(cobj)
       show='Click somewhere else';
       return
    end
    typ=get(cobj,'Type');
    cmp=strcmp(typ,type);
if cmp==1
    show=strcat(type,'FOUND');
else
    show='NOT FOUND';
end
end