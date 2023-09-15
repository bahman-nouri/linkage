function varargout = M_SliderCrank(varargin)
% M_SLIDERCRANK M-file for M_SliderCrank.fig
%      M_SLIDERCRANK, by itself, creates a new M_SLIDERCRANK or raises the existing
%      singleton*.
%
%      H = M_SLIDERCRANK returns the handle to a new M_SLIDERCRANK or the handle to
%      the existing singleton*.
%
%      M_SLIDERCRANK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M_SLIDERCRANK.M with the given input arguments.
%
%      M_SLIDERCRANK('Property','Value',...) creates a new M_SLIDERCRANK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M_SliderCrank_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M_SliderCrank_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M_SliderCrank

% Last Modified by GUIDE v2.5 22-May-2009 08:55:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M_SliderCrank_OpeningFcn, ...
                   'gui_OutputFcn',  @M_SliderCrank_OutputFcn, ...
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


% --- Executes just before M_SliderCrank is made visible.
function M_SliderCrank_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M_SliderCrank (see VARARGIN)

% Choose default command line output for M_SliderCrank
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M_SliderCrank wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M_SliderCrank_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function selection_Callback(hObject, eventdata, handles)
% hObject    handle to selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hiden3,'visible','off');


set(handles.axes1,'visible','off');
for m=1:5
   h=findobj('tag',num2str(m));
   delete(h);
   h=findobj('tag',strcat('beam',num2str(m)));
   delete(h);
   h=findobj('tag',strcat('xy_cons',num2str(m)));
   delete(h);
   h=findobj('tag',strcat('x_cons',num2str(m)));
   delete(h);
   h=findobj('tag',strcat('y_cons',num2str(m)));
   delete(h);
end





axes(handles.plot1)
image(imread('slider_crank.jpg'))
set(handles.hid,'visible','on');



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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1=get(handles.slider2,'value');
xlim([s1-20 20+s1]);
s1=get(handles.slider1,'value');
ylim([s1-20 20+s1]);

set(handles.axes1,'visible','on');

set(handles.hid,'visible','off');
%-------------------------------
phi1=str2num(get(handles.edit3,'string'))*pi/180;

phi2=str2num(get(handles.edit1,'string'))*pi/180;

phi3=str2num(get(handles.edit2,'string'))*pi/180;
%-------------------------------
s1=str2num(get(handles.edit6,'string'));

s2=str2num(get(handles.edit4,'string'));

s3=str2num(get(handles.edit5,'string'));
%-------------------------------

w1=s1*cos(phi1)-s2*cos(phi2);
w2=sin(phi1)-sin(phi2);
w3=s1.^2-s2.^2;

w4=s1*cos(phi1)-s3*cos(phi3);
w5=sin(phi1)-sin(phi3);
w6=s1.^2-s3.^2;

k1=(w2*w6-w3*w5)/(w2*w4-w1*w5);
k2=(w3*w4-w1*w6)/(w2*w4-w1*w5);
k3=-s1+k1*s1*cos(phi1)+k2*sin(phi1);

a1=k1/2;
a3=k2/(2*a1);
a2=sqrt(a1^2+a3^2-k3);

handles.my_data1 = a1;
handles.my_data2 = a2;
handles.my_data3 = a3;
handles.my_data4 = phi1;
handles.my_data5 = phi2;
handles.my_data6 = phi3;
guidata(hObject,handles);
%--------------------------------------------------------------------------
syms x1 y1 t1 x2 y2 t2 x3 y3 t3
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[0;0;phi1;1;1;1;1;1;0];
%--------------------------------------------------------------------------
c_qt=[x1-a1/2*cos(t1);...
      y1-a1/2*sin(t1);...
      x1+a1/2*cos(t1)-x2+a2/2*cos(t2);...
      y1+a1/2*sin(t1)-y2+a2/2*sin(t2);...
      x2+a2/2*cos(t2)-x3;...
      y2+a2/2*sin(t2)-y3;...
      t3;...
      y3-a3;...
      t1-phi1];
%--------------------------------------------------------------------------
 cq=inline(jacobian(c_qt,q));
 c=inline(c_qt);
%--------------------------------------------------------------------------
for k=1:13
cq0=cq(q0(3,1),q0(6,1));
c0=c(q0(3,1),q0(6,1),q0(9,1),q0(1,1),q0(4,1),q0(7,1),q0(2,1),q0(5,1),q0(8,1));
delta=-1*inv(cq0)*c0;
q0=q0+delta;
q0(3,1)=phi1;
end
axes(handles.axes1)
x1=q0(1,1)+a1/2*cos(q0(3,1));
y1=q0(2,1)+a1/2*sin(q0(3,1));
x2=q0(1,1)-a1/2*cos(q0(3,1));
y2=q0(2,1)-a1/2*sin(q0(3,1));
x=[x1 x2];
y=[y1 y2];
 
h=plot(x,y,'linewidth',1);
set(h,'tag',strcat('beam',num2str(1)));
hold on
 u= plot(x1,y1,'o','color','b');
  set(u,'tag','1')
u= plot(x2,y2,'o','color','b');
 set(u,'tag','2')
x1=q0(4,1)+a2/2*cos(q0(6,1));
y1=q0(5,1)+a2/2*sin(q0(6,1));
x2=q0(4,1)-a2/2*cos(q0(6,1));
y2=q0(5,1)-a2/2*sin(q0(6,1));
x=[x1 x2];
y=[y1 y2];


h=plot(x,y,'linewidth',1);
u= plot(x1,y1,'o','color','b');
set(u,'tag','3')
 u=plot(x2,y2,'o','color','b');
 set(u,'tag','4')
 
set(h,'tag',strcat('beam',num2str(2)));
hold on
v=[0-.3  0  0.3];
u=[0-.7  0  0-.7];

    TRI = delaunay(v,u);
   n=triplot(TRI,v,u,'k');
   set(n,'tag',strcat('xy_cons',num2str(3)));     
 n= rectangle('Position', [x1-.5,y1-.25,1,.5]);  
    set(n,'tag',strcat('y_cons',num2str(3)));   

% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 motion=get(handles.motion,'string');
 time=get(handles.time,'string');
intervals=get(handles.intervals,'string');
w=(str2num(motion)*pi)/(180*str2num(time));
a1=handles.my_data1;
a2=handles.my_data2;
a3=handles.my_data3;
phi1=handles.my_data4 ;
phi2=handles.my_data5 ;
phi3=handles.my_data6 ;

syms x1 y1 t1 x2 y2 t2 x3 y3 t3 t
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[0;0;phi1;1;1;1;1;1;0];
c_qt=[x1-a1/2*cos(t1);...
      y1-a1/2*sin(t1);...
      x1+a1/2*cos(t1)-x2+a2/2*cos(t2);...
      y1+a1/2*sin(t1)-y2+a2/2*sin(t2);...
      x2+a2/2*cos(t2)-x3;...
      y2+a2/2*sin(t2)-y3;...
      t3;...
      y3-a3;...
      t1-w*t-phi1];
%--------------------------------------------------------------------------
 cq=inline(jacobian(c_qt,q));
 c=inline(c_qt);
%--------------------------------------------------------------------------
t0=0;
for t=1:str2num(intervals)
    t0=str2num(time)/str2num(intervals)+t0;
for k=1:20
cq0=cq(q0(3,1),q0(6,1));
c0=c(t0,q0(3,1),q0(6,1),q0(9,1),q0(1,1),q0(4,1),q0(7,1),q0(2,1),q0(5,1),q0(8,1));
delta=-1*inv(cq0)*c0;
q0=q0+delta;
q0(3,1)=w*t0+phi1;
end
qqq(:,t)=q0;
hold on
 set(gcf,'pointer','arrow','doublebuffer','on');

%##########################################################################
for m=1:3
    h=findobj('tag',strcat('beam',num2str(m)));
    u=isempty(h);
    %----------------------------------------------------------------------
    if u==0
    
   
           r1=findobj('tag',num2str(2*m));
   x_node1=get(r1,'xdata');
   y_node1=get(r1,'ydata');
         r2=findobj('tag',num2str(2*m-1));
   x_node2=get(r2,'xdata');
   y_node2=get(r2,'ydata');
   
    length=sqrt((x_node2-x_node1)^2+ (y_node2-y_node1)^2);
    
    node1_x=q0(3*m-2,1)+length/2*cos(q0(3*m,1));
    node1_y=q0(3*m-1,1)+length/2*sin(q0(3*m,1));
    node2_x=q0(3*m-2,1)-length/2*cos(q0(3*m,1));
    node2_y=q0(3*m-1,1)-length/2*sin(q0(3*m,1));
  
set(h,'xdata',[node1_x , node2_x]);
set(h,'ydata',[node1_y , node2_y]);
set(r1,'xdata', node1_x);
set(r1,'ydata', node1_y);
set(r2,'xdata', node2_x);
set(r2,'ydata', node2_y);

%-----------------------------------------------------------
s1=get(handles.slider2,'value');
xlim([s1-20 20+s1]);
s1=get(handles.slider1,'value');
ylim([s1-20 20+s1]);
%-----------------------------------------------------------



    end
  
    %----------------------------------------------------------------------
 h=findobj('tag',strcat('y_cons',num2str(m)));
    u=isempty(h);
     if u~=1;
    
  delete(h);
  n= rectangle('Position', [q0(3*m-2,1)-.5,q0(3*m-1,1)-.25,1,.5]);  
  set(n,'tag',strcat('y_cons',num2str(m)));

  
      
     end   
    %----------------------------------------------------------------------
   
    h=findobj('tag',strcat('x_cons',num2str(m)));
   u=isempty(h);
    if u~=1;
  
  delete(h);
  n= rectangle('Position', [q0(3*m-2,1)-.5,q0(3*m-1,1)-.25,1,.5]);  
  set(n,'tag',strcat('x_cons',num2str(m)));  
  
  end   
    %----------------------------------------------------------------------
  end
%##########################################################################
 P(t) = getframe;
end
handles.position =qqq;
guidata(hObject,handles);



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function analysis_Callback(hObject, eventdata, handles)
% hObject    handle to analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --------------------------------------------------------------------
function nodeproperties_Callback(hObject, eventdata, handles)
% hObject    handle to nodeproperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q0=handles.position;


k=findbeam();

p_x=q0(3*k-2,:);
p_y=q0(3*k-1,:);
teta=q0(3*k,:);
t=0:.1:9.9;
xlim([-3,11])
ylim([-3,11])

axes(handles.axes1);
%plot(t,p_x)
hold on
plot(p_x,p_y)


% --------------------------------------------------------------------
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

q0=handles.position;


k=findbeam();

p_x=q0(3*k-2,:);
p_y=q0(3*k-1,:);
teta=q0(3*k,:);
t=0:.1:9.9;
%xlim([-3,11])
%ylim([-3,11])

axes(handles.axes1);
s1=get(handles.slider2,'value');
xlim([s1-20 20+s1]);
s1=get(handles.slider1,'value');
ylim([s1-20 20+s1]);


h=plot(p_x,p_y)




function motion_Callback(hObject, eventdata, handles)
% hObject    handle to motion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motion as text
%        str2double(get(hObject,'String')) returns contents of motion as a double


% --- Executes during object creation, after setting all properties.
function motion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function intervals_Callback(hObject, eventdata, handles)
% hObject    handle to intervals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervals as text
%        str2double(get(hObject,'String')) returns contents of intervals as a double


% --- Executes during object creation, after setting all properties.
function intervals_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function elementproperties_Callback(hObject, eventdata, handles)
% hObject    handle to elementproperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(handles.hiden3,'visible','on');
q0=handles.position;



p_x=q0(1,:);
p_y=q0(2,:);
teta=q0(3,:);
t=0:.1:9.9;
 time=str2num(get(handles.time,'string'));
intervals=str2num(get(handles.intervals,'string'));
t0=time/intervals;
t=t0:t0:time
axes(handles.axes9);


h=plot(t,p_x);
hold on
h=plot(t,p_y,'r');



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
phi1=str2num(get(handles.edit3,'string'))*pi/180;

phi2=str2num(get(handles.edit1,'string'))*pi/180;

phi3=str2num(get(handles.edit2,'string'))*pi/180;
%-------------------------------
s1=str2num(get(handles.edit6,'string'));

s2=str2num(get(handles.edit4,'string'));

s3=str2num(get(handles.edit5,'string'));
%-------------------------------

w1=s1*cos(phi1)-s2*cos(phi2);
w2=sin(phi1)-sin(phi2);
w3=s1.^2-s2.^2;

w4=s1*cos(phi1)-s3*cos(phi3);
w5=sin(phi1)-sin(phi3);
w6=s1.^2-s3.^2;

k1=(w2*w6-w3*w5)/(w2*w4-w1*w5);
k2=(w3*w4-w1*w6)/(w2*w4-w1*w5);
k3=-s1+k1*s1*cos(phi1)+k2*sin(phi1);

a1=k1/2;
a3=k2/(2*a1);
a2=sqrt(a1^2+a3^2-k3);
%--------------------------------------------------------------------------
syms x1 y1 t1 x2 y2 t2 x3 y3 t3
q=[x1; y1; t1; x2; y2; t2; x3; y3; t3];
q0=[0;0;phi1;1;1;1;1;1;0];
%--------------------------------------------------------------------------
sss=phi1+get(handles.slider3,'value');
c_qt=[x1-a1/2*cos(t1);...
      y1-a1/2*sin(t1);...
      x1+a1/2*cos(t1)-x2+a2/2*cos(t2);...
      y1+a1/2*sin(t1)-y2+a2/2*sin(t2);...
      x2+a2/2*cos(t2)-x3;...
      y2+a2/2*sin(t2)-y3;...
      t3;...
      y3-a3;...
      t1-sss];
%--------------------------------------------------------------------------
 cq=inline(jacobian(c_qt,q));
 c=inline(c_qt);
%--------------------------------------------------------------------------
for k=1:13
cq0=cq(q0(3,1),q0(6,1));
c0=c(q0(3,1),q0(6,1),q0(9,1),q0(1,1),q0(4,1),q0(7,1),q0(2,1),q0(5,1),q0(8,1));
delta=-1*inv(cq0)*c0;
q0=q0+delta;
q0(3,1)=sss;
end
axes(handles.axes8)
xlim([-20,20])
 ylim([-20,20])
x1=q0(1,1)+a1/2*cos(q0(3,1));
y1=q0(2,1)+a1/2*sin(q0(3,1));
x2=q0(1,1)-a1/2*cos(q0(3,1));
y2=q0(2,1)-a1/2*sin(q0(3,1));
x=[x1 x2];
y=[y1 y2];
 xlim([-20,20])
 ylim([-20,20])
 hold off

h=plot(x,y,'linewidth',1);
%set(h,'tag',strcat('beam',num2str(1)));
hold on
 u= plot(x1,y1,'o','color','b');
 % set(u,'tag','1')
u= plot(x2,y2,'o','color','b');
 %set(u,'tag','2')
x1=q0(4,1)+a2/2*cos(q0(6,1));
y1=q0(5,1)+a2/2*sin(q0(6,1));
x2=q0(4,1)-a2/2*cos(q0(6,1));
y2=q0(5,1)-a2/2*sin(q0(6,1));
x=[x1 x2];
y=[y1 y2];


h=plot(x,y,'linewidth',1);
u= plot(x1,y1,'o','color','b');
%set(u,'tag','3')
 u=plot(x2,y2,'o','color','b');
 %set(u,'tag','4')
 
%set(h,'tag',strcat('beam',num2str(2)));
hold on
v=[0-.3  0  0.3];
u=[0-.7  0  0-.7];

    TRI = delaunay(v,u);
   n=triplot(TRI,v,u,'k');
  % set(n,'tag',strcat('xy_cons',num2str(3)));     
 n= rectangle('Position', [x1-.5,y1-.25,1,.5]);  
   % set(n,'tag',strcat('y_cons',num2str(3)));   
xlim([-20,20])
 ylim([-20,20])
axes(handles.axes9);
 motion=get(handles.motion,'string');
 time=get(handles.time,'string');
intervals=get(handles.intervals,'string');
www=(str2num(motion)*pi)/(180*str2num(time));
 
d=get(handles.slider3,'value');
tt=d/www
plot(tt,q0(2,1),'+g');
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.hiden3,'visible','off');

