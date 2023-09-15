function varargout = pvaplot(varargin)
% PVAPLOT M-file for pvaplot.fig
%      PVAPLOT, by itself, creates a new PVAPLOT or raises the existing
%      singleton*.
%
%      H = PVAPLOT returns the handle to a new PVAPLOT or the handle to
%      the existing singleton*.
%
%      PVAPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PVAPLOT.M with the given input arguments.
%
%      PVAPLOT('Property','Value',...) creates a new PVAPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pvaplot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pvaplot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pvaplot

% Last Modified by GUIDE v2.5 23-Aug-2009 19:23:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @pvaplot_OpeningFcn, ...
    'gui_OutputFcn',  @pvaplot_OutputFcn, ...
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


% --- Executes just before pvaplot is made visible.
function pvaplot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pvaplot (see VARARGIN)

% Choose default command line output for pvaplot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pvaplot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pvaplot_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global q0 select_link answer
k=select_link;
value=get(handles.popupmenu1,'value');
if value==1
    cla
    t0=str2num(char(answer{2,1}))/str2num(char(answer{3,1}));
    p_x=q0(3*k-2,:);
    p_y=q0(3*k-1,:);
    teta=q0(3*k,:);
    [m,n]=size(p_x);
    %t=t0:t0:str2num(char(answer{2,1}));
    t=t0:t0:t0*n;
    axes(handles.axes1);

    h=plot(t,p_x,'b');
    hold on
    h=plot(t,p_y,'r');
    plot(t,teta,'k');
    legend('P[x]','P[y]','theta')
    set(handles.radiobutton1,'value',0);
    set(handles.radiobutton2,'value',0);
end

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global velocity select_link answer
[m,n]=size(velocity)
k=select_link;
value=get(handles.radiobutton1,'value');
if value==1
    cla
    for i=1:m
        for j=1:n
            i
            j
            v(i,j)=str2num(char(velocity(i,j)));
        end
    end
    v_x=v(3*k-2,:);
    v_y=v(3*k-1,:);
    w=v(3*k,:);
    [m,n]=size(v_x);

    t0=str2num(char(answer{2,1}))/str2num(char(answer{3,1}));
    t=t0:t0:t0*n;
    h=plot(t,v_x,'b');
    hold on
    h=plot(t,v_y,'r');
    plot(t,w,'k');
    legend('V[x]','V[y]','omega')
    set(handles.popupmenu1,'value',0);
    set(handles.radiobutton2,'value',0);
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global acceleration select_link answer
[m,n]=size(acceleration);
k=select_link;
value=get(handles.radiobutton2,'value');
if value==1
    cla
    for i=1:m
        for j=1:n
            a(i,j)=str2num(char(acceleration(i,j)));
        end
    end
    a_x=a(3*k-2,:);
    a_y=a(3*k-1,:);
    w=a(3*k,:);
    [m,n]=size(a_x);

    t0=str2num(char(answer{2,1}))/str2num(char(answer{3,1}));
    t=t0:t0:t0*n;
    h=plot(t,a_x,'b');
    hold on
    h=plot(t,a_y,'r');
    plot(t,w,'k');
    legend('A[x]','A[y]','alpha')
    set(handles.popupmenu1,'value',0);
    set(handles.radiobutton1,'value',0);
end