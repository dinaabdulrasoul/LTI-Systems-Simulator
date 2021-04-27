
function varargout = Input_GUI_2(varargin)
% INPUT_GUI_2 MATLAB code for Input_GUI_2.fig
%      INPUT_GUI_2, by itself, creates a new INPUT_GUI_2 or raises the existing
%      singleton*.
%
%      H = INPUT_GUI_2 returns the handle to a new INPUT_GUI_2 or the handle to
%      the existing singleton*.
%
%      INPUT_GUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUT_GUI_2.M with the given input arguments.
%
%      INPUT_GUI_2('Property','Value',...) creates a new INPUT_GUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Input_GUI_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Input_GUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Input_GUI_2

% Last Modified by GUIDE v2.5 27-May-2020 04:02:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Input_GUI_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Input_GUI_2_OutputFcn, ...
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



% --- Executes just before Input_GUI_2 is made visible.
function Input_GUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Input_GUI_2 (see VARARGIN)

matlabImage = imread('lti2.PNG');
image(matlabImage)
axis off
axis image

% Choose default command line output for Input_GUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Input_GUI_2 wait for user response (see UIRESUME)
% uiwait(handles.Input_GUI_2);


% --- Outputs from this function are returned to the command line.
function varargout = Input_GUI_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1




% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
step   = 1;
impulse= 0;
setappdata( 0 , 'step'   , 1);
setappdata( 0 , 'impulse', 0);
assignin('base','step' , 1);
assignin('base','impulse' , 0);

% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
step   = 0;
impulse= 1;
setappdata( 0 , 'step'   , 0);
setappdata( 0 , 'impulse', 1);
assignin('base','step' , 0);
assignin('base','impulse' , 1);
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



% --- Executes on button press in pushbutton1.


function pushbutton1_Callback(hObject, eventdata, handles)

n  = getappdata(0,'n');
m  = getappdata(0,'m');
msg = '';

if m > n
    msg = msgbox('The value of "m" cannot exceed the value of "n"');
else
    Output_GUI_2; 
end

%closereq(); %closes the GUI window

%--------------------------------------------------------------

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit4_Callback(hObject, eventdata, handles)
a1=str2double(get(handles.edit4,'string'));
assignin('base','a1' , a1);
setappdata( 0 , 'a1' , a1);
%assignin('base','a1',a1)
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
a2=str2double(get(handles.edit5,'string'));
assignin('base','a2' , a2);
setappdata( 0 , 'a2' , a2);
%assignin('base','a2',a2)

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
a3=str2double(get(handles.edit6,'string'));
assignin('base','a3' , a3);
setappdata( 0 , 'a3' , a3);
%assignin('base','a3',a3)

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



function edit7_Callback(hObject, eventdata, handles)
a4=str2double(get(handles.edit7,'string'));
assignin('base','a4' , a4);
setappdata( 0 , 'a4' , a4);
%assignin('base','a4',a4)

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
b1=str2double(get(handles.edit8,'string'));
assignin('base','b1' , b1);
setappdata( 0 , 'b1' , b1);
%assignin('base','b1',b1)

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



function edit9_Callback(hObject, eventdata, handles)
b2=str2double(get(handles.edit9,'string'));
assignin('base','b2' , b2);
setappdata( 0 , 'b2' , b2);
%assignin('base','b2',b2)

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



function edit10_Callback(hObject, eventdata, handles)
b3=str2double(get(handles.edit10,'string'));
assignin('base','b3' , b3);
setappdata( 0 , 'b3' , b3);

%assignin('base','b3',b3)

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



function edit11_Callback(hObject, eventdata, handles)
b4=str2double(get(handles.edit11,'string'));
assignin('base','b4' , b4);
setappdata( 0 , 'b4' , b4);
%assignin('base','b4',b4)

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



function edit12_Callback(hObject, eventdata, handles)
a0=str2double(get(handles.edit12,'string'));
assignin('base','a0' , a0);
setappdata( 0 , 'a0' , a0);

%assignin('base','a0',a0)

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



function edit13_Callback(hObject, eventdata, handles)
b0=str2double(get(handles.edit13,'string'));
assignin('base','b0' , b0);
setappdata( 0 , 'b0' , b0);
%assignin('base','b0',b0)

% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined fin a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
step=1
impulse=0
setappdata( 0 , 'step' , 1);
setappdata( 0 , 'impulse' , 0);
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)


% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close Input_GUI_2.
function Input_GUI_2_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to Input_GUI_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
n=0
setappdata( 0 , 'n' , 0);
assignin('base','n',0);
set(handles.edit12,'visible', 'on');
set(handles.text14,'visible', 'on');

% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
n=1
setappdata( 0 , 'n' , 1);
assignin('base','n' , 1);
set(handles.edit12,'visible', 'on');
set(handles.text14,'visible', 'on');
set(handles.edit4,'visible', 'on');
set(handles.text7,'visible', 'on');
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
n=2
assignin('base','n' , 2);
setappdata( 0 , 'n' , 2);
set(handles.edit12,'visible', 'on');
set(handles.text14,'visible', 'on');
set(handles.edit4,'visible', 'on');
set(handles.text7,'visible', 'on');
set(handles.edit5,'visible', 'on');
set(handles.text8,'visible', 'on');
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
n=3
assignin('base','n' , 3);
setappdata( 0 , 'n' , 3);
set(handles.edit12 ,'visible', 'on');
set(handles.text14 ,'visible', 'on');
set(handles.edit4  ,'visible', 'on');
set(handles.text7  ,'visible', 'on');
set(handles.edit5  ,'visible', 'on');
set(handles.text8  ,'visible', 'on');
set(handles.edit6  ,'visible', 'on');
set(handles.text10 ,'visible', 'on');
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
n=4
assignin('base','n' , 4);
setappdata( 0 , 'n' , 4);
set(handles.edit12,'visible', 'on');
set(handles.text14,'visible', 'on');
set(handles.edit4,'visible', 'on');
set(handles.text7,'visible', 'on');
set(handles.edit5,'visible', 'on');
set(handles.text8,'visible', 'on');
set(handles.edit6,'visible', 'on');
set(handles.text10,'visible', 'on');
set(handles.edit7,'visible', 'on');
set(handles.text18,'visible', 'on');
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
m=1
assignin('base','m' , 1);
setappdata( 0 , 'm' , 1);
set(handles.edit13,'visible', 'on');
set(handles.text15,'visible', 'on');
set(handles.edit8,'visible', 'on');
set(handles.text16,'visible', 'on');

% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
m=2
assignin('base','m' , 2);
setappdata( 0 , 'm' , 2);
set(handles.edit13,'visible', 'on');
set(handles.text15,'visible', 'on');
set(handles.edit8,'visible', 'on');
set(handles.text16,'visible', 'on');
set(handles.edit9,'visible', 'on');
set(handles.text12,'visible', 'on');
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
m=3
assignin('base','m' , 3);
setappdata( 0 , 'm' , 3);
set(handles.edit13,'visible', 'on');
set(handles.text15,'visible', 'on');
set(handles.edit8,'visible', 'on');
set(handles.text16,'visible', 'on');
set(handles.edit9,'visible', 'on');
set(handles.text12,'visible', 'on');
set(handles.edit10,'visible', 'on');
set(handles.text17,'visible', 'on');
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
m=4
assignin('base','m' , 4);
setappdata( 0 , 'm' , 4);
set(handles.edit13,'visible', 'on');
set(handles.text15,'visible', 'on');
set(handles.edit8,'visible', 'on');
set(handles.text16,'visible', 'on');
set(handles.edit9,'visible', 'on');
set(handles.text12,'visible', 'on');
set(handles.edit10,'visible', 'on');
set(handles.text17,'visible', 'on');
set(handles.edit11,'visible', 'on');
set(handles.text13,'visible', 'on');
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
m=0
assignin('base','m' , 0);
setappdata( 0 , 'm' , 0);
set(handles.edit13,'visible', 'on');
set(handles.text15,'visible', 'on');
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16


% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)
step   =1;
impulse=0;
setappdata( 0 , 'step' , 1);
setappdata( 0 , 'impulse' , 0);
assignin('base','step' , 1);
assignin('base','impulse' , 0);

% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
set(handles.edit12,'visible', 'off');
set(handles.text14,'visible', 'off');
set(handles.edit4,'visible', 'off');
set(handles.text7,'visible', 'off');
set(handles.edit5,'visible', 'off');
set(handles.text8,'visible', 'off');
set(handles.edit6,'visible', 'off');
set(handles.text10,'visible', 'off');
set(handles.edit7,'visible', 'off');
set(handles.text18,'visible', 'off');

% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
set(handles.edit13,'visible', 'off');
set(handles.text15,'visible', 'off');
set(handles.edit8,'visible', 'off');
set(handles.text16,'visible', 'off');
set(handles.edit9,'visible', 'off');
set(handles.text12,'visible', 'off');
set(handles.edit10,'visible', 'off');
set(handles.text17,'visible', 'off');
set(handles.edit11,'visible', 'off');
set(handles.text13,'visible', 'off');

% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18



% --- Executes when Input_GUI_2 is resized.
function Input_GUI_2_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to Input_GUI_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
