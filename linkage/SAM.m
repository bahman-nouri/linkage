function varargout = SAM(varargin)
% SAM M-file for SAM.fig
%      SAM, by itself, creates a new SAM or raises the existing
%      singleton*.
%
%      H = SAM returns the handle to a new SAM or the handle to
%      the existing singleton*.
%
%      SAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAM.M with the given input arguments.
%
%      SAM('Property','Value',...) creates a new SAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAM_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to SAM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES)
% Edit the above text to modify the response to help SAM
% Last Modified by GUIDE v2.5 28-Sep-2009 05:06:40
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SAM_OpeningFcn, ...
    'gui_OutputFcn',  @SAM_OutputFcn, ...
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


% --- Executes just before SAM is made visible.
function SAM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAM (see VARARGIN)

% Choose default command line output for SAM
h=waitbar(.3,'please wait');
waitbar(.4)
pause(.1);
waitbar(.5)
pause(.1);
waitbar(.6);
pause(.1);
waitbar(.8)
pause(.1);
global xylim GGrid
xylim=5;
GGrid=0;
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
waitbar(1)
close(h)
cla
global numberbeam numbernode_1 numbernode_2
numberbeam=1;
numbernode_1=1;
numbernode_2=2;

% UIWAIT makes SAM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAM_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --------------------------------------------------------------------
function beam_Callback(hObject, eventdata, handles)
% hObject    handle to beam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global numberbeam numbernode_1 numbernode_2
n=get(handles.n,'string');
numberbeam=get(handles.numberbeam,'string');
numbernode_1=get(handles.numbernode_1,'string');
numbernode_2=get(handles.numbernode_2,'string');

%--------------
lx=get(gca,'xlim');
ly=get(gca,'ylim');
xlim(lx);
ylim(ly);

Beam1();
xlim(lx);
ylim(ly);

[slope,l,center]=Beam2();
xlim(lx);
ylim(ly);
%%%%%%%%%%%%%%%%
q0=get(handles.q0,'string');
q0{str2num(numberbeam)*3-2,1}=(center(1,1));
q0{str2num(numberbeam)*3-1,1}=(center(1,2));
q0{str2num(numberbeam)*3,1}=(slope);
set(handles.q0,'string',q0);
%%%%%%%%%%%%%%%%
L=get(handles.L,'string');
%class numberbeam
jj=str2num(char(numberbeam));
L{str2num(char(numberbeam)),1}=l;
set(handles.L,'string',L);
%%%%%%%%%%%%%%%%
[c11,n,s]=revolute_constraint(n);

constraint=get(handles.c1,'string');

%-----------------------
if s==1
    for m=str2num(get(handles.n,'string')):str2num(get(handles.n,'string'))+1
        constraint{m,1}=c11{m,1};


    end
    set(handles.c1,'string',constraint);
    set(handles.n,'string',n);

end
n=get(handles.n,'string');
[c22,n,s1]=revolute_constraint2(n);
constraint=get(handles.c1,'string');

%-----------------------
if s1==1
    for m=str2num(get(handles.n,'string')):str2num(get(handles.n,'string'))+1
        constraint{m,1}=c22{m,1};


    end
    set(handles.c1,'string',constraint);
    set(handles.n,'string',n);

end



%--------------
set(handles.numberbeam,'string',str2num(numberbeam)+1);
set(handles.numbernode_1,'string',str2num(numbernode_1)+2);
set(handles.numbernode_2,'string',str2num(numbernode_2)+2);


% --------------------------------------------------------------------


% --------------------------------------------------------------------
function inputmotion_Callback(hObject, eventdata, handles)
% hObject    handle to inputmotion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global position_motor numbermotor
p=selection_motor();

if p~=1;
    position_motor=p;


    [rx,ry,tag]=selection_motor1();
    if tag~=0
        prompt={'motion[deg]:',  'time[s]:','intervals:'};
        name='Input Motor';
        numlines=1;
        defaultanswer={'360','10','45'};
        answer=inputdlg(prompt,name,numlines,defaultanswer);
        w=(str2num(answer{1,1})*pi)/(180*str2num(answer{2,1}))
        q0=get(handles.q0,'string');
        n=get(handles.n,'string')
        nw=str2num(tag(5))

        numbermotor=nw
        w0=str2num(char(q0(3*nw,1)))
        constraint=get(handles.c1,'string')
        c=strcat('t',num2str(nw),'-',num2str(w),'*t-(',num2str(w0),')')
        constraint{str2num(n),1}=c

        set(handles.c1,'string',constraint)
        set(handles.n,'string',str2num(n)+1)
        s1=position_motor(1,1)-rx(1,1);
        s2=position_motor(1,1)-rx(1,2);
        s3=position_motor(1,2)-ry(1,1);
        s4=position_motor(1,2)-ry(1,2);
        if s1==0&s3==0|s2==0&s4==0

            handles.numbber =nw;


        else
            errordlg ('Angles not connected or angle motion defined');
        end
    end
    guidata(hObject,handles);
end
% ---------------------
% --------------------------------------------------------------------
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function analysis_Callback(hObject, eventdata, handles)
% hObject    handle to analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global answer q0 select_link velocity acceleration
select_link=findbeam();
pvaplot;
q0=handles.position_matrix;
velocity=handles.velocity_matrix;
acceleration=handles.acceleration_matrix;


% --------------------------------------------------------------------
function animation_Callback(hObject, eventdata, handles)
% hObject    handle to animation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=findbeam();
q0=handles.position_matrix;

p_x=q0(3*k-2,:);
p_y=q0(3*k-1,:);
teta=q0(3*k,:);

axes(handles.axes1);
type=questdlg('select type of show  :','Selection','Curve'...
    ,'point','Curve');
if strcmp(type,'Curve')
    h=plot(p_x,p_y,'color','red')
end
if strcmp(type,'point')
h=plot(p_x,p_y,'.','color','red')
end


%h=plot(p_x,p_y,'o','color','red')



% --------------------------------------------------------------------
function fixrelativeangle_Callback(hObject, eventdata, handles)
% hObject    handle to fixrelativeangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

q0=get(handles.q0,'string');
[tag1,u1]=fixrelativeangle;
if u1==0
    %---------------------------------
    [tag2,u2]=fixrelativeangle;
    if u2==0
        t=isequal(tag1,tag2)
        if t==1
            errordlg('');
        else
            %-------------------------------------------------------------------------
            m1=q0(3*str2num(tag1),1);
            m2=q0(3*str2num(tag2),1);
            n=get(handles.n,'string');
            constraint=get(handles.c1,'string');
            m=str2num(char(m2))-str2num(char(m1));
            % e=inputdlg
            %-------------------------------------------------------------
            prompt = {'Enter rpm:'};
            dlg_title = 'Input for rpm';
            num_lines = 1;
            def = {'.7'};
            e = inputdlg(prompt,dlg_title,num_lines,def)

            %------------------------------------------------------------------
            % c=strcat('t',num2str(tag1),'-t',num2str(tag2),'+(',num2str(m),')');
            c=strcat('t',num2str(tag1),'-t',num2str(tag2),'+',num2str(char(e)),'*t','+(',num2str(m),')');
            constraint{str2num(n),1}=c;

            set(handles.c1,'string',constraint);
            set(handles.n,'string',str2num(n)+1);
            %-------------------------------------------------------------------------
        end
    else
        errordlg('');
    end
    %-----------------------------
else
    errordlg('')
end
% --------------------------------------------------------------------
function fixnode_Callback(hObject, eventdata, handles)
% hObject    handle to fixnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gro=0;
global numberbeam numbernode_1 numbernode_2 ground
numbernode_1=get(handles.numbernode_1,'string');
numbernode_2=get(handles.numbernode_2,'string');
numberbeam=get(handles.numberbeam,'string');
%ground=get(handles.ground,'string');
[x_node,y_node,m,gro]=FixNode1();
ground=gro;

if m==1
    s=FixNode2();
    n=get(handles.n,'string');
    [c,n]=prismatic_constraint(s,x_node,y_node,n);
    constraint=get(handles.c1,'string');
    h=get(handles.n,'string');
    if s~=0
        for m=str2num(h):str2num(h)+3
            constraint{m,1}=c{m,1};
        end
    else
        for m=str2num(h):str2num(h)+1
            constraint{m,1}=c{m,1};
        end
    end
    set(handles.c1,'string',constraint);

    set(handles.n,'string',n);


    if s==0
        set(handles.numberbeam,'string',str2num(numberbeam));
        set(handles.numbernode_1,'string',str2num(numbernode_1));
        set(handles.numbernode_2,'string',str2num(numbernode_2));


    else
        set(handles.numberbeam,'string',str2num(numberbeam)+1);
        set(handles.numbernode_1,'string',str2num(numbernode_1)+2);
        set(handles.numbernode_2,'string',str2num(numbernode_2)+2);

        q0=get(handles.q0,'string');
        q0{str2num(numberbeam)*3-2,1}=x_node;
        q0{str2num(numberbeam)*3-1,1}=y_node;
        q0{str2num(numberbeam)*3,1}=0;
        set(handles.q0,'string',q0);
        %%%%%%%%%%%%%%%%
        L=get(handles.L,'string');
        L{str2num(numberbeam),1}=0;
        set(handles.L,'string',L);


    end
end
% --------------------------------------------------------------------
function elementproperties1_Callback(hObject, eventdata, handles)
% hObject    handle to elementproperties1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function nodeproperties1_Callback(hObject, eventdata, handles)
% hObject    handle to nodeproperties1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hid,'visible','off');

% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton1.

global numberbeam answer numbermotor
syms x1 x2 x3 x4 x5 x6 x7
syms y1 y2 y3 y4 y5 y6 y7
syms t1 t2 t3 t4 t5 t6 t7 t

q=[x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7];
const=get(handles.c1,'string');
[ww,ee]=size(const);
for r=1:ww
    ct(r,1)=diff(char(const{r,1}),t);
end

L=get(handles.L,'string');
if numbermotor~=0
    b=numbermotor;
    q0=get(handles.q0,'string');
    [tt,rr]=size(q0);
    w0=str2num(char(q0(3*b,1)));
    sq0=get(handles.q0,'string');

    if ww==tt
        %---------------------jacobian matrix-------------------------------------
        for t=1:ww
            cq{t,1} =inline(jacobian(char(const(t,1)),q));
        end

        %--------------------------------------------------------------------------

        q0=zeros(21,1);
        for i=1:ww
            q0(i,1)=str2num(char(sq0(i,1)));
        end

        t0=0;
        w=(str2num(char(answer{1,1}))*pi)/(180*str2num(char(answer{2,1})));
        r=size(q0);
        t0=0;
        for t=1:str2num(char(answer{3,1}));
            t0=str2num(char(answer{2,1}))/str2num(char(answer{3,1}))+t0;
            for rw=1:3

                for k=1:ww
                    z=inline(const{k,1},'t','x1','y1','t1','x2','y2','t2','x3','y3','t3',...
                        'x4','y4','t4','x5','y5','t5','x6','y6','t6','x7','y7','t7');
                    c_qt(k,1)=z(t0,q0(1,1),q0(2,1),q0(3,1),q0(4,1),q0(5,1),q0(6,1),q0(7,1),q0(8,1),q0(9,1),...
                        q0(10,1),q0(11,1),q0(12,1),q0(13,1),q0(14,1),q0(15,1),q0(16,1),q0(17,1),q0(18,1),q0(19,1),q0(20,1),q0(21,1));
                end
                %------------------------------------set value in jacobian-----------------

                for i=1:ww

                    gh= cq{i,1};
                    xy=const{i,1};
                    [n,u]=size(xy);
                    andis=zeros(1,2);
                    d=0;
                    k=1;
                    for s=1:u
                        p1=isequal(xy(s),'s');
                        p2=isequal(xy(s),'c');

                        if p1==1|p2==1

                            for s=1:u-1
                                r=isequal(xy(s),'t');
                                if r==1
                                    andis(1,k)=str2num(xy(s+1));

                                    k=k+1;
                                    d=d+1 ;
                                end
                            end
                            if d==1
                                cq1=gh(q0(3*andis(1,1)));

                                for j=1:ww

                                    cq0(i,j)=cq1(1,j);

                                end

                            elseif d==2

                                if andis(1,1)< andis(1,2)
                                    cq1=gh(q0(3*andis(1,1)),q0(3*andis(1,2)));
                                else
                                    cq1=gh(q0(3*andis(1,2)),q0(3*andis(1,1)));
                                end
                                for j=1:ww
                                    cq0(i,j)=cq1(1,j);
                                end
                            end
                            break
                        end
                    end
                    if p1==0&p2==0
                        cq1=gh(0);
                        for j=1:ww
                            cq0(i,j)=cq1(1,j);
                        end
                    end
                end
                %-------------------------------------------------------------------------

                delta=-1*inv(cq0)*c_qt;
                q0(1:ww,1)=delta+q0(1:ww,1);
                q0(3*b,1)=w*t0+w0;
            end

            velocity(:,t)=-1*inv(cq0)*ct;

            qqq(:,t)=q0(1:ww,1);
            %3333333333333333333333333333333333333333333333
            u=dot(c_qt',c_qt)
            if u>=.001
                errordlg('can not continue!')
            end
            %--------------------------------plot mechanism----------------------------
            for m=1:ww/3

                h=findobj('tag',strcat('beam',num2str(m)));

                u=isempty(h);
                %-------------------------------------------------------------
                if u==0
                    h1=findobj('tag',strcat(num2str(2*m)));
                    h2=findobj('tag',strcat(num2str(2*m-1)));
                    l=str2num(char(L(m,1)));
                    node1_x=q0(3*m-2,1)+l/2*cos(q0(3*m,1));
                    node1_y=q0(3*m-1,1)+l/2*sin(q0(3*m,1));
                    node2_x=q0(3*m-2,1)-l/2*cos(q0(3*m,1));
                    node2_y=q0(3*m-1,1)-l/2*sin(q0(3*m,1));
                    set(h,'xdata',[ node1_x,node2_x]);
                    set(h,'ydata',[ node1_y,node2_y]);
                    set(h1,'xdata', node1_x);
                    set(h1,'ydata', node1_y);
                    set(h2,'xdata', node2_x);
                    set(h2,'ydata', node2_y);
                end
                h=findobj('tag',strcat('y_cons',num2str(m)));
                u=isempty(h);
                Dx=get(gca,'Xlim');
                a=Dx(1,2)-Dx(1,1);
                R1=a/5*.3;
                R2=a/5*.1;
                if u==0

                    delete(h);
                    t= rectangle('Position', [q0(3*m-2)-R2/2,q0(3*m-1)-R1/2,R2,R1]);

                    set(t,'tag',strcat('y_cons',num2str(m)));
                end
                %--------------------------------------------------------------

                h=findobj('tag',strcat('x_cons',num2str(m)));
                u=isempty(h);
                if u==0

                    delete(h);

                    t= rectangle('Position',[q0(3*m-2)-R1/2,q0(3*m-1)-R2/2,R1,R2]);
                    set(t,'tag',strcat('x_cons',num2str(m)));
                end
            end
            %------------------------------------------------------------------------
            pause(.000001);
            handles.position_matrix =qqq;
            handles.velocity_matrix =velocity;
            guidata(hObject,handles);
        end
    else
        errordlg('mechanism is undefined')
        % beep
    end
else
    errordlg('select motor')
end







function NumberBeam_Callback(hObject, eventdata, handles)
% hObject    handle to NumberBeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberBeam as text
%        str2double(get(hObject,'String')) returns contents of NumberBeam as a double


% --- Executes during object creation, after setting all properties.
function NumberBeam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberBeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c1 as text
%        str2double(get(hObject,'String')) returns contents of c1 as a double


% --- Executes during object creation, after setting all properties.
function c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
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



function time_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.



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





function q0_Callback(hObject, eventdata, handles)
% hObject    handle to q0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q0 as text
%        str2double(get(hObject,'String')) returns contents of q0 as a double


% --- Executes during object creation, after setting all properties.
function q0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L as text
%        str2double(get(hObject,'String')) returns contents of L as a double


% --- Executes during object creation, after setting all properties.
function L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
% --------------------------------------------------------------------
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool5_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global numberbeam answer numbermotor
syms x1 x2 x3 x4 x5 x6 x7
syms y1 y2 y3 y4 y5 y6 y7
syms t1 t2 t3 t4 t5 t6 t7 t

q=[x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7];
const=get(handles.c1,'string');
[ww,ee]=size(const);
maple('restart')
for r=1:ww
    ct(r,1)=diff(char(const{r,1}),t);
end
L=get(handles.L,'string');
if numbermotor~=0
    b=numbermotor;
    q0=get(handles.q0,'string');
    [tt,rr]=size(q0);
    w0=str2num(char(q0(3*b,1)));
    sq0=get(handles.q0,'string');

    if ww==tt
        %---------------------jacobian matrix-------------------------------------
        maple('restart')
        for t=1:ww
            cq{t,1} =inline(jacobian(char(const(t,1)),q));
        end

        %--------------------------------------------------------------------------

        q0=zeros(21,1);
        for i=1:ww
            q0(i,1)=str2num(char(sq0(i,1)));
        end

        t0=0;
        w=(str2num(char(answer{1,1}))*pi)/(180*str2num(char(answer{2,1})));



        r=size(q0);
        t0=0;
        for t=1:str2num(char(answer{3,1}));
            t0=str2num(char(answer{2,1}))/str2num(char(answer{3,1}))+t0;
            for rw=1:3

                for k=1:ww
                    z=inline(const{k,1},'t','x1','y1','t1','x2','y2','t2','x3','y3','t3',...
                        'x4','y4','t4','x5','y5','t5','x6','y6','t6','x7','y7','t7');
                    c_qt(k,1)=z(t0,q0(1,1),q0(2,1),q0(3,1),q0(4,1),q0(5,1),q0(6,1),q0(7,1),q0(8,1),q0(9,1),...
                        q0(10,1),q0(11,1),q0(12,1),q0(13,1),q0(14,1),q0(15,1),q0(16,1),q0(17,1),q0(18,1),q0(19,1),q0(20,1),q0(21,1));
                end
                %------------------------------------set value in jacobian-----------------

                for i=1:ww

                    gh= cq{i,1};
                    xy=const{i,1};
                    [n,u]=size(xy);
                    andis=zeros(1,2);
                    d=0;
                    k=1;
                    for s=1:u
                        p1=isequal(xy(s),'s');
                        p2=isequal(xy(s),'c');

                        if p1==1|p2==1

                            for s=1:u-1
                                r=isequal(xy(s),'t');
                                if r==1
                                    andis(1,k)=str2num(xy(s+1));

                                    k=k+1;
                                    d=d+1 ;
                                end
                            end
                            if d==1
                                cq1=gh(q0(3*andis(1,1)));

                                for j=1:ww

                                    cq0(i,j)=cq1(1,j);

                                end

                            elseif d==2

                                if andis(1,1)< andis(1,2)
                                    cq1=gh(q0(3*andis(1,1)),q0(3*andis(1,2)));
                                else
                                    cq1=gh(q0(3*andis(1,2)),q0(3*andis(1,1)));
                                end
                                for j=1:ww
                                    cq0(i,j)=cq1(1,j);
                                end
                            end
                            break
                        end
                    end
                    if p1==0&p2==0
                        cq1=gh(0);
                        for j=1:ww
                            cq0(i,j)=cq1(1,j);
                        end
                    end
                end
                %-------------------------------------------------------------------------

                delta=-1*inv(cq0)*c_qt;
                q0(1:ww,1)=delta+q0(1:ww,1);
                q0(3*b,1)=w*t0+w0;
            end

            velocity(:,t)=-1*inv(cq0)*ct;
            %1111111111111111111111111111111111111111111111111111111111111111111
            for u=1:ww
                for v=1:ww
                    cqq(u,v)=diff(char(const{u,1}),q(1,v));
                end
            end
            s=  cqq*velocity(:,t);
            g=q(1,1:ww);

            for u=1:ww
                cqw{u,1} =inline(jacobian(s(u,1),g));
            end

            for i=1:ww

                gh= cqw{i,1};
                xy=const{i,1};
                [n,u]=size(xy);
                andis=zeros(1,2);
                d=0;
                k=1;
                for s=1:u
                    p1=isequal(xy(s),'s');
                    p2=isequal(xy(s),'c');

                    if p1==1|p2==1

                        for s=1:u-1
                            r=isequal(xy(s),'t');
                            if r==1
                                andis(1,k)=str2num(xy(s+1));

                                k=k+1;
                                d=d+1 ;
                            end
                        end
                        if d==1
                            cq1=gh(q0(3*andis(1,1)));

                            for j=1:ww

                                cqh(i,j)=cq1(1,j);

                            end

                        elseif d==2

                            if andis(1,1)< andis(1,2)
                                cq1=gh(q0(3*andis(1,1)),q0(3*andis(1,2)));
                            else
                                cq1=gh(q0(3*andis(1,2)),q0(3*andis(1,1)));
                            end
                            for j=1:ww
                                cqh(i,j)=cq1(1,j);
                            end
                        end
                        break
                    end
                end
                if p1==0&p2==0
                    cq1=gh(0);
                    for j=1:ww
                        cqh(i,j)=cq1(1,j);
                    end
                end
            end
            Qd=cqh*velocity(:,t);

            acceleration(:,t)=-1*inv(cq0)*Qd;
            %1111111111111111111111111111111111111111111111111111111111111111111
            qqq(:,t)=q0(1:ww,1);
            u=dot(c_qt',c_qt);
            if u>=.001
                errordlg('can not')
                break
            end
            %--------------------------------plot mechanism----------------------------
            for m=1:ww/3

                h=findobj('tag',strcat('beam',num2str(m)));

                u=isempty(h);
                %-------------------------------------------------------------
                if u==0
                    h1=findobj('tag',strcat(num2str(2*m)));
                    h2=findobj('tag',strcat(num2str(2*m-1)));
                    l=str2num(char(L(m,1)));
                    node1_x=q0(3*m-2,1)+l/2*cos(q0(3*m,1));
                    node1_y=q0(3*m-1,1)+l/2*sin(q0(3*m,1));
                    node2_x=q0(3*m-2,1)-l/2*cos(q0(3*m,1));
                    node2_y=q0(3*m-1,1)-l/2*sin(q0(3*m,1));
                    set(h,'xdata',[ node1_x,node2_x]);
                    set(h,'ydata',[ node1_y,node2_y]);
                    set(h1,'xdata', node1_x);
                    set(h1,'ydata', node1_y);
                    set(h2,'xdata', node2_x);
                    set(h2,'ydata', node2_y);
                end
                Dx=get(gca,'Xlim');
                a=Dx(1,2)-Dx(1,1);
                R1=a/5*.3;
                R2=a/5*.1;
                T1=a/5*.1;
                T2=a/5*.2;
                h=findobj('tag',strcat('y_cons',num2str(m)));
                u=isempty(h);
                if u==0

                    delete(h);
                    t= rectangle('Position', [q0(3*m-2)-R1/2,q0(3*m-1)-R2/2,R1,R2]);

                    set(t,'tag',strcat('y_cons',num2str(m)));
                end
                %--------------------------------------------------------------
                Dx=get(gca,'Xlim');
                a=Dx(1,2)-Dx(1,1);
                h=findobj('tag',strcat('x_cons',num2str(m)));
                u=isempty(h);
                if u==0

                    delete(h);

                    t= rectangle('Position',[q0(3*m-2)-R2/2,q0(3*m-1)-R1/2,R2,R1]);
                    set(t,'tag',strcat('x_cons',num2str(m)));
                end
            end
            %------------------------------------------------------------------------
            pause(.000001);
            handles.position_matrix =qqq;
            handles.velocity_matrix =velocity;
            handles.acceleration_matrix =acceleration;
            guidata(hObject,handles);
        end
    else
        errordlg('mechanism is undefined')
        % beep
    end
else
    errordlg('select motor')
end




% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



global numberbeam numbernode_1 numbernode_2 GGrid
n=get(handles.n,'string');
numberbeam=get(handles.numberbeam,'string');
numbernode_1=get(handles.numbernode_1,'string');
numbernode_2=get(handles.numbernode_2,'string');
hold on
%--------------
lx=get(gca,'xlim');
ly=get(gca,'ylim');
xlim(lx);
ylim(ly);
%if GGrid==1
    %axes(handles.axes1);
  %  set(gca,'XMinorGrid','on');
 %   set(gca,'YMinorGrid','on');
%end
Beam1();
xlim(lx);
ylim(ly);

[slope,l,center]=Beam2();
xlim(lx);
ylim(ly);
%%%%%%%%%%%%%%%%
q0=get(handles.q0,'string');
q0{str2num(numberbeam)*3-2,1}=(center(1,1));
q0{str2num(numberbeam)*3-1,1}=(center(1,2));
q0{str2num(numberbeam)*3,1}=(slope);
set(handles.q0,'string',q0);
%%%%%%%%%%%%%%%%
L=get(handles.L,'string');
jj=str2num(char(numberbeam));
L{str2num(char(numberbeam)),1}=l;
set(handles.L,'string',L);
%%%%%%%%%%%%%%%%
[c11,n,s]=revolute_constraint(n);
constraint=get(handles.c1,'string');
%-----------------------
if s==1
    for m=str2num(get(handles.n,'string')):str2num(get(handles.n,'string'))+1
        constraint{m,1}=c11{m,1};
    end
    set(handles.c1,'string',constraint);
    set(handles.n,'string',n);

end
n=get(handles.n,'string');
[c22,n,s1]=revolute_constraint2(n);
constraint=get(handles.c1,'string');

%-----------------------
if s1==1
    for m=str2num(get(handles.n,'string')):str2num(get(handles.n,'string'))+1
        constraint{m,1}=c22{m,1};


    end
    set(handles.c1,'string',constraint);
    set(handles.n,'string',n);

end



%--------------
set(handles.numberbeam,'string',str2num(numberbeam)+1);
set(handles.numbernode_1,'string',str2num(numbernode_1)+2);
set(handles.numbernode_2,'string',str2num(numbernode_2)+2);


% --------------------------------------------------------------------


% --------------------------------------------------------------------
function uipushtool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------------------------------------------------------------------
q0=get(handles.q0,'string');
[tag1,u1]=fixrelativeangle;
if u1==0
    [tag2,u2]=fixrelativeangle;
    if u2==0
        t=isequal(tag1,tag2)
        if t==1
            errordlg('click on Beam');
        else
            %-------------------------------------------------------------------------
            m1=q0(3*str2num(tag1),1);
            m2=q0(3*str2num(tag2),1);
            n=get(handles.n,'string');
            constraint=get(handles.c1,'string');
            m=str2num(char(m2))-str2num(char(m1));
            c=strcat('t',num2str(tag1),'-t',num2str(tag2),'+(',num2str(m),')');
            constraint{str2num(n),1}=c;
            set(handles.c1,'string',constraint);
            set(handles.n,'string',str2num(n)+1);
            %-------------------------------------------------------------------------
        end
    else
        errordlg('click on Beam');
    end
else
    errordlg('click on Beam')
end
%--------------------------------------------------------------------------







% --------------------------------------------------------------------
function uipushtool15_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lx=get(gca,'xlim');
ly=get(gca,'ylim');
gro=0;
global numberbeam numbernode_1 numbernode_2 ground
numbernode_1=get(handles.numbernode_1,'string');
numbernode_2=get(handles.numbernode_2,'string');
numberbeam=get(handles.numberbeam,'string');
%ground=get(handles.ground,'string');
[x_node,y_node,m,gro]=FixNode1();
ground=gro;

if m==1
    s=FixNode2();
    n=get(handles.n,'string');
    [c,n]=prismatic_constraint(s,x_node,y_node,n);
    constraint=get(handles.c1,'string');
    h=get(handles.n,'string');
    if s~=0
        for m=str2num(h):str2num(h)+3
            constraint{m,1}=c{m,1};
        end
    else
        for m=str2num(h):str2num(h)+1
            constraint{m,1}=c{m,1};
        end
    end
    set(handles.c1,'string',constraint);

    set(handles.n,'string',n);


    if s==0
        set(handles.numberbeam,'string',str2num(numberbeam));
        set(handles.numbernode_1,'string',str2num(numbernode_1));
        set(handles.numbernode_2,'string',str2num(numbernode_2));
        xlim(lx);
        ylim(ly);

    else
        set(handles.numberbeam,'string',str2num(numberbeam)+1);
        set(handles.numbernode_1,'string',str2num(numbernode_1)+2);
        set(handles.numbernode_2,'string',str2num(numbernode_2)+2);

        q0=get(handles.q0,'string');
        q0{str2num(numberbeam)*3-2,1}=x_node;
        q0{str2num(numberbeam)*3-1,1}=y_node;
        q0{str2num(numberbeam)*3,1}=0;
        set(handles.q0,'string',q0);
        %%%%%%%%%%%%%%%%
        L=get(handles.L,'string');
        L{str2num(numberbeam),1}=0;
        set(handles.L,'string',L);
        xlim(lx);
        ylim(ly);
    end
end


%andles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function uipushtool16_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global position_motor numbermotor answer
p=selection_motor();
if p~=1;
    position_motor=p;


    [rx,ry,tag]=selection_motor1();
    if tag~=0
        prompt={'motion[deg]:',  'time[s]:','intervals:'};
        name='Input Motor';
        numlines=1;
        defaultanswer={'360','10','45'};
        answer=inputdlg(prompt,name,numlines,defaultanswer);
        w=(str2num(answer{1,1})*pi)/(180*str2num(answer{2,1}));
        q0=get(handles.q0,'string');
        n=get(handles.n,'string');
        nw=str2num(tag(5));

        numbermotor=nw ;
        w0=str2num(char(q0(3*nw,1)));
        constraint=get(handles.c1,'string');
        c=strcat('t',num2str(nw),'-',num2str(w),'*t-(',num2str(w0),')');
        constraint{str2num(n),1}=c;

        set(handles.c1,'string',constraint);
        set(handles.n,'string',str2num(n)+1);
        s1=position_motor(1,1)-rx(1,1);
        s2=position_motor(1,1)-rx(1,2);
        s3=position_motor(1,2)-ry(1,1);
        s4=position_motor(1,2)-ry(1,2);
        if s1==0&s3==0|s2==0&s4==0

            handles.numbber =nw;


        else
            errordlg ('Angles not connected or angle motion defined');
        end
    end
    guidata(hObject,handles);
end
% ---------------------

% --------------------------------------------------------------------
function uipushtool17_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q0=get(handles.q0,'string');
[tag1,u1]=fixrelativeangle;
if u1==0
    %---------------------------------
    [tag2,u2]=fixrelativeangle;
    if u2==0
        t=isequal(tag1,tag2)
        if t==1
            errordlg('click on Beam');
        else
            %-------------------------------------------------------------------------
            m1=q0(3*str2num(tag1),1);
            m2=q0(3*str2num(tag2),1);
            n=get(handles.n,'string');
            constraint=get(handles.c1,'string');
            m=str2num(char(m2))-str2num(char(m1));
            % e=inputdlg
            %-------------------------------------------------------------
            prompt = {'Enter rpm:'};
            dlg_title = 'Input for rpm';
            num_lines = 1;
            def = {'.7'};
            e = inputdlg(prompt,dlg_title,num_lines,def)

            %------------------------------------------------------------------
            % c=strcat('t',num2str(tag1),'-t',num2str(tag2),'+(',num2str(m),')');
            c=strcat('t',num2str(tag1),'-t',num2str(tag2),'+',num2str(char(e)),'*t','+(',num2str(m),')');
            constraint{str2num(n),1}=c;

            set(handles.c1,'string',constraint);
            set(handles.n,'string',str2num(n)+1);
            %-------------------------------------------------------------------------
        end
    else
        errordlg('click on Beam');
    end
    %-----------------------------
else
    errordlg('click on Beam')
end



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qqq=[];
set(handles.slider1,'Enable','off');
global numberbeam answer numbermotor
syms x1 x2 x3 x4 x5 x6 x7
syms y1 y2 y3 y4 y5 y6 y7
syms t1 t2 t3 t4 t5 t6 t7 t

q=[x1 y1 t1 x2 y2 t2 x3 y3 t3 x4 y4 t4 x5 y5 t5 x6 y6 t6 x7 y7 t7];
const=get(handles.c1,'string');
[ww,ee]=size(const);

L=get(handles.L,'string');
if numbermotor~=0
    b=numbermotor
    q0=get(handles.q0,'string');
    [tt,rr]=size(q0);
    value=get(handles.slider1,'value')
    w0=value;
    sq0=get(handles.q0,'string');

    if ww==tt
        %---------------------jacobian matrix-------------------------------------
        for t=1:ww
            cq{t,1} =inline(jacobian(char(const(t,1)),q));
        end

        %--------------------------------------------------------------------------

        q0=zeros(21,1);
        for i=1:ww
            q0(i,1)=str2num(char(sq0(i,1)));
        end
        %--------------------------------------------------
        for i=1:ww
            gh= cq{i,1};
            xy=const{i,1};
            [n,u]=size(xy);
            if u~=2


                p1=isequal(xy(1:2),strcat('t',num2str(numbermotor)));
                p2=isequal(xy(4),'t');
                if p1==1&p2~=1
                    const{i,1}=strcat('t',num2str(numbermotor),'-',num2str(value));

                    break
                end
            end
        end
        %---------------------------------------------------
        r=size(q0);
        t0=0;

        for rw=1:7

            for k=1:ww
                z=inline(const{k,1},'t','x1','y1','t1','x2','y2','t2','x3','y3','t3',...
                    'x4','y4','t4','x5','y5','t5','x6','y6','t6','x7','y7','t7');
                c_qt(k,1)=z(t0,q0(1,1),q0(2,1),q0(3,1),q0(4,1),q0(5,1),q0(6,1),q0(7,1),q0(8,1),q0(9,1),...
                    q0(10,1),q0(11,1),q0(12,1),q0(13,1),q0(14,1),q0(15,1),q0(16,1),q0(17,1),q0(18,1),q0(19,1),q0(20,1),q0(21,1));
            end
            %------------------------------------set value in jacobian-----------------

            for i=1:ww

                gh= cq{i,1};
                xy=const{i,1};
                [n,u]=size(xy);
                andis=zeros(1,2);
                d=0;
                k=1;
                for s=1:u
                    p1=isequal(xy(s),'s');
                    p2=isequal(xy(s),'c');

                    if p1==1|p2==1

                        for s=1:u-1
                            r=isequal(xy(s),'t');
                            if r==1
                                andis(1,k)=str2num(xy(s+1));

                                k=k+1;
                                d=d+1 ;
                            end
                        end
                        if d==1
                            cq1=gh(q0(3*andis(1,1)));

                            for j=1:ww

                                cq0(i,j)=cq1(1,j);

                            end

                        elseif d==2

                            if andis(1,1)< andis(1,2)
                                cq1=gh(q0(3*andis(1,1)),q0(3*andis(1,2)));
                            else
                                cq1=gh(q0(3*andis(1,2)),q0(3*andis(1,1)));
                            end
                            for j=1:ww
                                cq0(i,j)=cq1(1,j);
                            end
                        end
                        break
                    end
                end
                if p1==0&p2==0
                    cq1=gh(0);
                    for j=1:ww
                        cq0(i,j)=cq1(1,j);
                    end
                end
            end
            %-------------------------------------------------------------------------

            delta=-1*inv(cq0)*c_qt;
            q0(1:ww,1)=delta+q0(1:ww,1);
            q0(3*b,1)=value;
        end
        u=dot(c_qt',c_qt);
        if u>=.01
            errordlg('can not')
        end

        qqq(:,1)=q0(1:ww,1);
        %--------------------------------plot mechanism----------------------------
        for m=1:ww/3

            h=findobj('tag',strcat('beam',num2str(m)));

            u=isempty(h);
            %-------------------------------------------------------------
            if u==0
                h1=findobj('tag',strcat(num2str(2*m)));
                h2=findobj('tag',strcat(num2str(2*m-1)));
                l=str2num(char(L(m,1)));
                node1_x=q0(3*m-2,1)+l/2*cos(q0(3*m,1));
                node1_y=q0(3*m-1,1)+l/2*sin(q0(3*m,1));
                node2_x=q0(3*m-2,1)-l/2*cos(q0(3*m,1));
                node2_y=q0(3*m-1,1)-l/2*sin(q0(3*m,1));
                set(h,'xdata',[ node1_x,node2_x]);
                set(h,'ydata',[ node1_y,node2_y]);
                set(h1,'xdata', node1_x);
                set(h1,'ydata', node1_y);
                set(h2,'xdata', node2_x);
                set(h2,'ydata', node2_y);
            end
            h=findobj('tag',strcat('y_cons',num2str(m)));
            u=isempty(h);
            if u==0

                delete(h);
                t= rectangle('Position', [q0(3*m-2)-.25,q0(3*m-1)-.1,.5,.2]);

                set(t,'tag',strcat('y_cons',num2str(m)));
            end
            %--------------------------------------------------------------

            h=findobj('tag',strcat('x_cons',num2str(m)));
            u=isempty(h);
            if u==0

                delete(h);

                t= rectangle('Position',[q0(3*m-2)-.1,q0(3*m-1)-.25,.2,.5]);
                set(t,'tag',strcat('x_cons',num2str(m)));
            end
        end
        %------------------------------------------------------------------------

    else
        errordlg('undefined')
        % beep
    end
else
    errordlg('select motor')
end
set(handles.slider1,'Enable','on');


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
%A=get(handles.size,'string');
%A=str2num(char(A));
global xylim
A=xylim;
value=get(handles.slider2,'value');
%if A>.1
%    set(handles.slider2,'Max',2*A);
%    value=get(handles.slider2,'value');
value=-value;
a=get(gca,'Xlim');
b=get(gca,'Ylim');
cx=(a(1,1)+a(1,2))/2;
cy=(b(1,1)+b(1,2))/2;
axes(handles.axes1);
if cx+value<cx-value
    Xlim([cx+value cx-value]);
end
if cy+value<cy-value
    Ylim([cy+value cy-value]);
end
xylim=-value;
set(handles.slider3,'Min',a(1,1));
set(handles.slider3,'Max',a(1,2));
set(handles.slider4,'Min',b(1,1));
set(handles.slider4,'Max',b(1,2));
set(handles.slider3,'value',cx);
set(handles.slider4,'value',cy);

%set(handles.size,'string',num2str(-value));
%set(handles.slider3,'Max',(-value));
%set(handles.slider3,'Min',(value));
%set(handles.slider4,'Max',(-value));
%set(handles.slider4,'Min',(value));

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
function uitoggletool10_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GGrid
GGrid=1;
axes(handles.axes1);
set(gca,'XMinorGrid','on');
set(gca,'YMinorGrid','on');
% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zequation;

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%A=get(handles.size,'string');
%A=str2num(char(A));
global xylim
%set(handles.slider3,'Min',-xylim);
%set(handles.slider3,'Max',+xylim);
value=get(handles.slider3,'value');
set(gca,'Xlim',[-xylim+value xylim+value]);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%A=get(handles.size,'string');
%A=str2num(char(A));
global xylim
%set(handles.slider4,'Min',-xylim);
%set(handles.slider4,'Max',+xylim);
value=get(handles.slider4,'value');
set(gca,'Ylim',[-xylim+value xylim+value]);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --------------------------------------------------------------------
function uitoggletool10_OffCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GGrid
GGrid=0;
axes(handles.axes1);
set(gca,'XMinorGrid','off');
set(gca,'YMinorGrid','off');


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function wizard_Callback(hObject, eventdata, handles)
% hObject    handle to wizard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function library1_Callback(hObject, eventdata, handles)
% hObject    handle to library1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library1

% --------------------------------------------------------------------
function library2_Callback(hObject, eventdata, handles)
% hObject    handle to library2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library2

% --------------------------------------------------------------------
function library3_Callback(hObject, eventdata, handles)
% hObject    handle to library3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library3

% --------------------------------------------------------------------
function library4_Callback(hObject, eventdata, handles)
% hObject    handle to library4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library4

% --------------------------------------------------------------------
function library5_Callback(hObject, eventdata, handles)
% hObject    handle to library5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library5

% --------------------------------------------------------------------
function library6_Callback(hObject, eventdata, handles)
% hObject    handle to library6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library7

% --------------------------------------------------------------------
function library7_Callback(hObject, eventdata, handles)
% hObject    handle to library7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
library8



% --------------------------------------------------------------------
function Build_Callback(hObject, eventdata, handles)
% hObject    handle to Build (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function synthesis2_Callback(hObject, eventdata, handles)
% hObject    handle to synthesis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zequation_Callback(hObject, eventdata, handles)
% hObject    handle to Zequation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zequation


% --------------------------------------------------------------------
function Analysis2_Callback(hObject, eventdata, handles)
% hObject    handle to Analysis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text23,'visible','off');
set(handles.text24,'visible','off');
set(handles.text25,'visible','off');
set(handles.axes1,'visible','on');
axes(handles.axes1);
cla;
xlim([-5 5]);
ylim([-5 5]);
set(handles.c1,'value',1);
set(handles.c1,'string','');
zero={'0';'0';'0';'0';'0';'0';'0';'0';'0';'0';'0';'0'};
set(handles.L,'string',zero);
set(handles.q0,'string','');
set(handles.n,'string','1');
set(handles.numberbeam,'string','1');
set(handles.numbernode_1,'string','1');
set(handles.numbernode_2,'string','2');
a=get(handles.q0,'string');
[m,n]=size(a);
%%>>>>>>>>>>>>>>>>>>>>>
global numberbeam numbernode_1 numbernode_2
numberbeam=1;
numbernode_1=1;
numbernode_2=2;
%.........................................
set(handles.slider2,'max',10);
set(handles.slider2,'value',5);
%.........................................
set(handles.slider3,'max',5);
set(handles.slider3,'min',-5);
set(handles.slider3,'value',0);
%........................................
set(handles.slider4,'max',5);
set(handles.slider4,'min',-5);
set(handles.slider4,'value',0);

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help2_Callback(hObject, eventdata, handles)
% hObject    handle to help2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web(['file:///' which('Help.htm')]);

% --------------------------------------------------------------------
function Demo_Callback(hObject, eventdata, handles)
% hObject    handle to Demo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Demos


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web(['file:///' which('about.htm')]);



% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
const=[2;3;3];
w=3;
   button = questdlg('Do you want to save the chang?');
   if (button(1)=='Y')
       [filename, pathname]=uiputfile('*.ascii','Save Data');
  if  filename~=0
       fid=fopen([pathname, filename],'w+')
       ii=1;
         while (ii<w)
         fprintf(fid,'   %7.3f  ',const);   
         ii=ii+1;
         end
        fclose('all')
      end 
   end
if (button(1)=='N')
delete(hObject); 
end



% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname]=uigetfile('*.ascii','Load txt File');
    fid=fopen([pathname, filename],'r');
    data=fgets(fid)

fclose('all')

function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setaxis.
function setaxis_Callback(hObject, eventdata, handles)
% hObject    handle to setaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=get(handles.size,'string');
A=str2num(char(A));
set(gca,'Xlim',[-A A]);
set(gca,'Ylim',[-A A]);
global xylim
xylim=A;


% --------------------------------------------------------------------
function uipushtool18_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setaxis;
MX=get(gca,'Xlim');
MY=get(gca,'Ylim');
M=[abs(MX(1,1)) abs(MX(1,2)) abs(MY(1,1)) abs(MY(1,2))]
a=max(M)
%center=[(MX(1,2)+MX(1,1))/2 (MY(1,1)+MY(1,2))/2]
set(gca,'Xlim',[-a  a]);
set(gca,'Ylim',[-a  a]);
set(handles.size,'string',num2str(a));

set(handles.slider3,'max',a);
set(handles.slider3,'min',-a);
set(handles.slider3,'value',0);

set(handles.slider4,'Max',a);
set(handles.slider4,'min',-a);
set(handles.slider4,'value',0);
%set(handles.slider2,'value',a);
global xylim
xylim=a;
set(handles.slider2,'Max',4*xylim);
set(handles.slider2,'value',xylim);
%...................................


% --------------------------------------------------------------------
function tools_Callback(hObject, eventdata, handles)
% hObject    handle to tools (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GG_Callback(hObject, eventdata, handles)
% hObject    handle to GG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function point_Callback(hObject, eventdata, handles)
% hObject    handle to point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(gcf,'pointer','cross');
%function mohsen(src,evnt)
%if strcmp(get('SelectionType')
type=questdlg('select type of input point   with:','Selection','mouse'...
    ,'keyboard','mouse');
if strcmp(type,'mouse')
    point
    set(gcf,'pointer','arrow');
end
if strcmp(type,'keyboard')
    prompt={'X','Y'};
    name='input coordinate';
    numlines=1;
    defaultanswer={'0','0'};
    answer=inputdlg(prompt,name,numlines,defaultanswer);
    hold on;
    fig=findobj('Tag','figure1') ;
    set(fig,'WindowButtonDownFcn',@wbdcb);
    ah=get(fig,'currentaxes');
    plot(str2num(answer{1,1}),str2num(answer{2,1}),'.','color','black');
    str = ['(',answer{1,1},', ',answer{2,1},')'];    
    text(str2num(answer{1,1}),str2num(answer{2,1}),str,...
        'VerticalAlignment','bottom','color','black');drawnow
end
    

 
        



% --------------------------------------------------------------------
function Fit_Callback(hObject, eventdata, handles)
% hObject    handle to Fit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc



% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text23,'visible','on');
set(handles.text24,'visible','on');
set(handles.text25,'visible','on');
set(handles.axes1,'visible','off');




% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fourbar



% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('fourbar2');

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('slider');



% --------------------------------------------------------------------
function uipushtool19_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text23,'visible','off');
set(handles.text24,'visible','off');
set(handles.text25,'visible','off');
set(handles.axes1,'visible','on');
axes(handles.axes1);
cla;
xlim([-5 5]);
ylim([-5 5]);
set(handles.c1,'value',1);
set(handles.c1,'string','');
zero={'0';'0';'0';'0';'0';'0';'0';'0';'0';'0';'0';'0'};
set(handles.L,'string',zero);
set(handles.q0,'string','');
set(handles.n,'string','1');
set(handles.numberbeam,'string','1');
set(handles.numbernode_1,'string','1');
set(handles.numbernode_2,'string','2');
a=get(handles.q0,'string');
[m,n]=size(a);
%%>>>>>>>>>>>>>>>>>>>>>
global numberbeam numbernode_1 numbernode_2
numberbeam=1;
numbernode_1=1;
numbernode_2=2;
%.........................................
set(handles.slider2,'max',10);
set(handles.slider2,'value',5);
%.........................................
set(handles.slider3,'max',5);
set(handles.slider3,'min',-5);
set(handles.slider3,'value',0);
%........................................
set(handles.slider4,'max',5);
set(handles.slider4,'min',-5);
set(handles.slider4,'value',0);

