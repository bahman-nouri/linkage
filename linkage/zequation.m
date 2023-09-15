function varargout = zequation(varargin)
% ZEQUATION M-file for zequation.fig
%      ZEQUATION, by itself, creates a new ZEQUATION or raises the existing
%      singleton*.
%      H = ZEQUATION returns the handle to a new ZEQUATION or the handle to
%      the existing singleton*.
%
%      ZEQUATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZEQUATION.M with the given input arguments.
%
%      ZEQUATION('Property','Value',...) creates a new ZEQUATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zequation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zequation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zequation

% Last Modified by GUIDE v2.5 28-Sep-2009 11:39:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @zequation_OpeningFcn, ...
    'gui_OutputFcn',  @zequation_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before zequation is made visible.
function zequation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zequation (see VARARGIN)

% Choose default command line output for zequation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes zequation wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = zequation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3...
%as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
%function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
%function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'),
set(hObject,'BackgroundColor','white');
%end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.listbox2,'value');
b=get(handles.listbox2,'string');
if a>1;
    d=(get(handles.edit3,'string'));
    d=char(d);
    dd=str2num(d);
    [xx,yy]=size(dd);
    if xx==0;
        errordlg('input is error')
    else
        c=b{a,1};
        [x,y]=size(c);
        if y>0
            b{a,1}='';
            b1=revolute(b);
            set(handles.listbox2,'value',1);
            b2=remspace(b1,2);
            set(handles.listbox2,'string',b2);
            ss=createspace(c,':=');
            ss=createspace(ss,d);
            sss={ss};
            ee=get(handles.listbox4,'string');
            ee=revolute(ee);
            ee=stick(ee,sss);
            set(handles.listbox4,'value',1);
            ee=remspace(ee,2);
            set(handles.listbox4,'string',ee);
        end
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.listbox3,'value');
b=get(handles.listbox3,'string');
if a>1
    d=(get(handles.edit2,'string'));
    d=char(d);
    dd=str2num(d);
    [xx,yy]=size(dd);
    if xx==0;
        errordlg('input is error')
    else
        c=b{a,1};
        [x,y]=size(c);
        if y>0
            b{a,1}='';
            b1=revolute(b);
            set(handles.listbox3,'value',1);
            b2=remspace(b1,2);
            set(handles.listbox3,'string',b2);
            ss=createspace(c,':=');
            ss=createspace(ss,d);
            sss={ss};
            ee=get(handles.listbox5,'string');
            ee=revolute(ee);
            ee=stick(ee,sss);
            set(handles.listbox5,'value',1);
            ee=remspace(ee,2);
            set(handles.listbox5,'string',ee);
        end
    end
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.listbox4,'value');
b=get(handles.listbox4,'string');
if a>1
    c=b{a,1};
    [x,y]=size(c);
    if y>0
        b{a,1}='';
        b1=revolute(b);
        set(handles.listbox4,'value',1);
        b2=remspace(b1,2);
        set(handles.listbox4,'string',b2);
        ..............get parameter
            taken=strtok(c);
        sss{1,1}=taken;
        ee=get(handles.listbox2,'string');
        ee=revolute(ee);
        ee=stick(ee,sss);
        ee=remspace(ee,2);
        set(handles.listbox2,'value',1);
        set(handles.listbox2,'string',ee);
    end
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.listbox5,'value');
b=get(handles.listbox5,'string');
if a>1
    c=b{a,1};
    [x,y]=size(c);
    if y>0
        b{a,1}='';
        b1=revolute(b);
        b2=remspace(b1,2);
        set(handles.listbox5,'value',1);
        set(handles.listbox5,'string',b2);
        ..............get parameter
            taken=strtok(c);
        sss{1,1}=taken;
        ee=get(handles.listbox3,'string');
        ee=revolute(ee);
        [m,n]=size(ee);
        if n==1
            ee=ee{1,1};
        end
        ee=stick(ee,sss);
        ee=remspace(ee,2);
        set(handles.listbox3,'value',1);
        set(handles.listbox3,'string',ee);
    end
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1=get(handles.edit1,'string');
a2=tafkik1(a1);
[m1,n1]=size(a2);
if n1==1 | n1==2
    errordlg('input error');
else
    [b1,b2,b3]=realize(a2);
    [kk,jj]=size(b2);
    if jj>1
        b2=realize(b2);
    end
    %show1==get zequ
    ......................show equ
        show1=get(handles.listbox1,'string');
    show1=revolute(show1);
    a2=remspace(a2,1);
    [xx,yy]=size(a2);
    if mod(yy,2)==1
        errordlg('input is error');
    else
        z=zequ(a2);
        z=revolute(z);
        s1=stick(z,show1);
        set(handles.listbox1,'string',s1);
        %..........................
        s2=get(handles.listbox2,'string');
        s3=get(handles.listbox3,'string');
        s2=revolute(s2);
        s3=revolute(s3);
        f2=stick(s2,b2);
        f3=stick(s3,b3);
        set(handles.listbox2,'value',1);
        set(handles.listbox3,'value',1);
        f2=remspace(f2,1);
        f3=remspace(f3,1);
        set(handles.listbox2,'string',f2);
        set(handles.listbox3,'string',f3);
        A1=get(handles.listbox2,'string');
        B1=get(handles.listbox3,'string');
        A1=revolute(A1);
        B1=revolute(B1);
        A1=remspace(A1,1);
        B1=remspace(B1,1);
        [m1,n1]=size(A1);
        [m1,n2]=size(B1);
        n=(n2+n1)-2;
        set(handles.text5,'string',num2str(n));
        C1=get(handles.listbox1,'string');
        C1=revolute(C1);
        C1=remspace(C1,1);
        [m3,n3]=size(C1);
        set(handles.text6,'string',num2str(n3));
        num=get(handles.listbox7,'value');
        D=get(handles.listbox7,'string');
        D=revolute(D);
        D4{1,1}=a1;
        f4=stick(D,D4);
        set(handles.listbox7,'string',f4);
        set(handles.togglebutton1,'Enable','on');
    end
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maple('restart');
set(handles.edit1,'Enable','off');
show=get(handles.listbox1,'string');
[m,n]=size(show);
h3 = waitbar(0,'Please wait...');
A1=get(handles.listbox2,'string');
B1=get(handles.listbox3,'string');
A1=revolute(A1);
B1=revolute(B1);
A1=remspace(A1,1);
B1=remspace(B1,1);
[l1,k1]=size(A1);
[l2,k2]=size(B1);
k=(k1+k2-2);
f=get(handles.text6,'string');
f=str2num(f);
waitbar(.1);
if k==f;
set(handles.edit6,'value',1);
set(handles.edit10,'value',1);
set(handles.edit6,'string','Lenght para');
set(handles.edit10,'string','Angle para');
    for i=1:m;
        [x,y]=size(show{i,1});
        if y>0
            equ1{i,1}=strcat('f',num2str(i),':=',show{i,1});
            maple(equ1{i,1});
        end
    end
    waitbar(0.1);
    A=get(handles.listbox4,'string');
    B=get(handles.listbox5,'string');
    [m1,n1]=size(A);
    [m2,n2]=size(B);
    for i=2:m1
        [x,y]=size(A{i,1});
        if y>0
            maple(A{i,1});
        end
    end
    waitbar(.2);
    for i=2:m2
        [x,y]=size(B{i,1});
        if y>0
            [taken1,remain]=strtok(B{i,1});
            [taken,remain]=strtok(remain);
            remain=str2num(remain);
            remain=remain*3.1416/180;
            st=strcat(taken1,':=',num2str(remain));
            maple(st);
        end
    end
    [m3,n3]=size(equ1);
    for i=1:m3;
        [x,y]=size(equ1{i,1});
        if y>0
            [taken,remain]=strtok(show{i,1});
            equ2{i,1}=strcat('g',num2str(i),':=','f',num2str(i),taken);
            maple(equ2{i,1});
        end
    end
    waitbar(.4);
    for i=1:m3;
        if i==1
            sa=strcat('(','g',num2str(i),',');
        end
        if 1<i & i<m3
            la=strcat('g',num2str(i),',');
            sa=strcat(sa,la);
        end
        if i==m3;
            sa=strcat(sa,'g',num2str(i),')');
        end
    end
    A1=get(handles.listbox2,'string');
    [w1,w2]=size(A1);
    sa=strcat('stringofzequation',':=','fsolve','(','{',sa,'}',')');
    r=maple(sa);
    numberpara=get(handles.text6,'string');
    numberpara=str2num(numberpara);
    answ=result(r,numberpara);
    waitbar(.5);
    controlans=answ{1,1};
    kk=strcmp(controlans,'imposible');
    if kk==0;
        ..............2222...............
        A1=get(handles.listbox2,'string');
        B1=get(handles.listbox3,'string');
        AA1=get(handles.edit6,'string');
        BB1=get(handles.edit10,'string');
        for i=1:numberpara
            [para,remain]=strtok(answ{i,1});
            [token,svalue]=strtok(remain);
            d=search(A1,para);
            if d==1;
                value=str2num(svalue);
                ss=createspace(para,':=');
                answ{i,1}=createspace(ss,svalue);
                AAA1=revolute(AA1);
                j1=stick(AAA1,{answ{i,1}});
                j1=remspace(j1,2);
                set(handles.edit6,'string',j1)
            end
            waitbar(.6);
            d=search(B1,para);
            if d==1
                value=str2num(svalue);
                value=value*180/3.1415;
                while value>360;
                    value=value-360;
                end
                while value<0
                    value=value+360;
                end
                if value>180
                    value=value-360;
                end
                svalue=num2str(value);
                ss=createspace(para,':=');
                answ{i,1}=createspace(ss,svalue);
                BBB1=revolute(BB1);
                j1=stick(BBB1,{answ{i,1}});
                j1=remspace(j1,2);
                set(handles.edit10,'string',j1)
            end   
        AA1=get(handles.edit6,'string');
        BB1=get(handles.edit10,'string');
        end
        waitbar(.9);
        %set(handles.edit6,'string',answ);
        set(handles.pushbutton7,'Enable','on');
    else
        set(handles.edit6,'string',{'result:';'ckeck assumes!!!'});
        waitbar(.9);
    end
end
close(h3)







% --- Executes on selection change in listbox6.
%function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6


% --- Executes during object creation, after setting all properties.
%function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,
%    set(hObject,'BackgroundColor','white');
%end


% --- Executes on selection change in popupmenu1.
%function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        popupmenu1


% --- Executes during object creation, after setting all properties.
%function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'),
%   set(hObject,'BackgroundColor','white');
%end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%SAM;
fig=findobj('Tag','figure1');
set(0,'CurrentFigure',fig);
%ah=findobj('Tag','axes1')
%axes(handles.axes1);
ah=get(fig,'currentaxes');
A=get(handles.edit6,'string');
B=get(handles.edit10,'string');
[m1,n1]=size(A);
[m2,n2]=size(B);
for i=2:m1
    [x,y]=size(A{i,1});
    if y>0
        maple(A{i,1});
    end
end
for i=2:m2
    [x,y]=size(B{i,1});
    if y>0
        [taken1,remain]=strtok(B{i,1});
        [taken,remain]=strtok(remain);
        remain=str2num(remain);
        remain=remain*3.1416/180;
        st=strcat(taken1,':=',num2str(remain));
        maple(st);
    end
end
a=get(handles.listbox7,'value');
if a>1
    A=get(handles.listbox7,'string');
    B1=A{a,1};
    B2=tafkik1(B1);
    startpoint=str2num(char(get(handles.edit4,'string')));
    endpoint=str2num(char(get(handles.edit5,'string')));
    drawresult(B2,startpoint,endpoint);
    hold on
end


% --- Executes on selection change in listbox7.
function listbox7_Callback(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox7


% --- Executes during object creation, after setting all properties.
function listbox7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maple('restart')
%%%%%%
set(handles.edit1,'Enable','on');
set(handles.pushbutton7,'Enable','off');
%%%%%%
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
%%%
set(handles.listbox2,'value',1);
set(handles.listbox2,'value',1);
set(handles.listbox3,'value',1);
set(handles.listbox4,'value',1);
set(handles.listbox5,'value',1);
set(handles.edit6,'value',1);
set(handles.edit10,'value',1);
set(handles.listbox7,'value',1);
%%%
set(handles.listbox1,'string','');
set(handles.listbox2,'string','length para');
set(handles.listbox3,'string','Angle para');
set(handles.listbox4,'string','assumes');
set(handles.listbox5,'string','assumes');
set(handles.edit6,'string','length ans');
set(handles.edit10,'string','Angle ans');
set(handles.listbox7,'string','z equation');
set(handles.text6,'string','0');
set(handles.text5,'string','0');
set(handles.togglebutton1,'Enable','off');
set(handles.pushbutton1,'Enable','on');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton3,'Enable','on');
set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton5,'Enable','on');
set(handles.pushbutton6,'Enable','on');
%%%


% --------------------------------------------------------------------
function save_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile('*.zeq','Save Data');
if filename~=0
    fid = fopen(filename)
end
fprintf(fid,'mohsen Darrehshiry \n');
fprintf(fid,'shotor');



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
value=get(handles.togglebutton1,'value');
if value==1
    Lenghtpara=get(handles.listbox2,'string');
    Anglepara=get(handles.listbox3,'string');
    show=get(handles.listbox1,'string');
    equation=get(handles.listbox7,'string');
    set(handles.listbox2,'Style','edit');
    set(handles.listbox2,'Max',400);
    set(handles.listbox2,'string',Lenghtpara);
    set(handles.pushbutton2,'Enable','off');
    set(handles.pushbutton3,'Enable','off');
    set(handles.pushbutton4,'Enable','off');
    set(handles.pushbutton5,'Enable','off');
    %%%%%
    set(handles.listbox3,'Style','edit');
    set(handles.listbox3,'Max',400);
    set(handles.listbox3,'string',Anglepara);
    %%%%
    set(handles.listbox1,'Style','edit');
    set(handles.listbox1,'Max',400);
    set(handles.listbox1,'string',show);
    %%%%
    set(handles.listbox7,'Style','edit');
    set(handles.listbox7,'Max',400);
    set(handles.listbox7,'string',equation);
    set(handles.pushbutton7,'Enable','off');
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton6,'Enable','off');
end
if value==0
    Lenghtpara1=get(handles.listbox2,'string');
    Anglepara1=get(handles.listbox3,'string');
    show1=get(handles.listbox1,'string');
    equation1=get(handles.listbox7,'string');
    Lenghtpara1{1,1}='Lenght para';
    Anglepara1{1,1}='Angle para';
    equation1{1,1}='z equation';
    set(handles.listbox2,'Style','listbox');
    set(handles.listbox2,'Max',400);
    set(handles.listbox2,'string',Lenghtpara1);
    %%%%%
    set(handles.listbox3,'Style','listbox');
    set(handles.listbox3,'Max',400);
    set(handles.listbox3,'string',Anglepara1);
    %%%%
    set(handles.listbox1,'Style','listbox');
    set(handles.listbox1,'Max',400);
    set(handles.listbox1,'string',show1);
    %%%%
    set(handles.listbox7,'Style','listbox');
    set(handles.listbox7,'Max',400);
    set(handles.listbox7,'string',equation1);
    set(handles.pushbutton2,'Enable','on');
    set(handles.pushbutton3,'Enable','on');
    set(handles.pushbutton4,'Enable','on');
    set(handles.pushbutton5,'Enable','on');
    %%%%
    [m1,n1]=size(Lenghtpara1);
    [m2,n2]=size(Anglepara1);
    [m3,n3]=size(show1);
    set(handles.text6,'string',num2str(m3));
    set(handles.text5,'string',num2str(m1+m2-2));
    set(handles.pushbutton7,'Enable','on');
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton6,'Enable','on');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


