function varargout = Output_GUI_2(varargin)
% OUTPUT_GUI_2 MATLAB code for Output_GUI_2.fig
%      OUTPUT_GUI_2, by itself, creates a new OUTPUT_GUI_2 or raises the existing
%      singleton*.
%
%      H = OUTPUT_GUI_2 returns the handle to a new OUTPUT_GUI_2 or the handle to
%      the existing singleton*.
%
%      OUTPUT_GUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OUTPUT_GUI_2.M with the given input arguments.
%
%      OUTPUT_GUI_2('Property','Value',...) creates a new OUTPUT_GUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Output_GUI_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Output_GUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Output_GUI_2

% Last Modified by GUIDE v2.5 07-Jun-2020 03:48:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Output_GUI_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Output_GUI_2_OutputFcn, ...
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


% --- Executes just before Output_GUI_2 is made visible.
function Output_GUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Output_GUI_2 (see VARARGIN)

% Choose default command line output for Output_GUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Output_GUI_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Output_GUI_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in show_res.
function show_res_Callback(hObject, eventdata, handles)

%GETTING INPUT COEFF-------------------------------------------------------

a0 = getappdata(0,'a0');
a1 = getappdata(0,'a1');
a2 = getappdata(0,'a2');
a3 = getappdata(0,'a3');
a4 = getappdata(0,'a4');

b0 = getappdata(0,'b0');
b1 = getappdata(0,'b1');
b2 = getappdata(0,'b2');
b3 = getappdata(0,'b3');
b4 = getappdata(0,'b0');

%SETTING INITIAL CONDITIONS AND VALUES-------------------------------------

n       = getappdata(0,'n');
m       = getappdata(0,'m');
T       = 0.0001;
Ns      = 100000;
u       = zeros(1,Ns);
Y       = zeros(1,Ns);
impulse = getappdata(0,'impulse');
step    = getappdata(0,'step');
time    = 0:T:Ns*T-T;
A=[];
B=[];
C=[];
D=[];

%SETTING INPUT SIGNAL U----------------------------------------------------

if step == 1
    for K = 5:1:Ns
        u(K) = 1;
    end
elseif impulse == 1
    for K = 5:1:Ns
        if K == 5
          u (K) = 1/T;
        else
          u (K) = 0;
        end
    end
else
    display('CHECK INPUT ARRAY SETTING CONDITIONS')
end

%SETTING ANY UNUSED COEFF AS ZERO------------------------------------------

if     n==3
    a4=0;
elseif n==2
    a4=0;
    a3=0;
elseif n==1
    a4=0;
    a3=0;
    a2=0;
end


if     m==3
    b4=0;
elseif m==2
    b4=0;
    b3=0;
elseif m==1
    b4=0;
    b3=0;
    b2=0;
elseif m==0
    b4=0;
    b3=0;
    b2=0;
    b1=0;
end

%SETTING GENERALIZATION VALUES AND ARRAYS----------------------------------

Coeff  = 0;
%y_dot1 = zeros(1,Ns);
%y_dot2 = zeros(1,Ns);
%y_dot3 = zeros(1,Ns);
%y_dot4 = zeros(1,Ns);
x1     = zeros(1,Ns);
x2     = zeros(1,Ns);
x3     = zeros(1,Ns);
x4     = zeros(1,Ns);

%PLOTTING Y AGAINST TIME---------------------------------------------------

%for K = 5:Ns
    

%    u1=(u(K)-u(K-1))/T;
%    u2=(u(K)-2*u(K-1)+u(K-2))/(T*T);
%    u3=(u(K)-3*u(K-1)+3*u(K-2)-u(K-3))/(T*T*T);
%    u4=(u(K)-4*u(K-1)+6*u(K-2)-4*u(K-3)+u(K-4))/(T*T*T*T);
%    Coeff=a0+(a1/T)+(a2/(T*T))+(a3/(T*T*T))+(a4/(T*T*T*T));
%    y_dot1=(-a1/T)*Y(K-1);
%    y_dot2=y_dot1+(-2*a2/(T*T))*(Y(K-1))+(a2/(T*T))*(Y(K-2));
%    y_dot3=y_dot2+((-3*a3*Y(K-1))/(T*T*T))+((3*a3*Y(K-2))/(T*T*T))+((-1*a3*Y(K-3))/(T*T*T));
%    y_dot4=y_dot3+(((-4*Y(K-1))+(6*Y(K-2))+(-4*Y(K-3))+Y(K-4))*(a4/(T*T*T*T)));
%    Y(K)=(b0*u(K)+(b1*u1)+(b2*u2)+(b3*u3)+(b4*u4)-y_dot4)/Coeff;
    
%end

%axes(handles.Y_plot);
%axis on
%grid on
%%xlabel ('time')
%%ylabel ('Y')
%%title('Output (Y)')
%plot(time, Y);

%PLOTTING STAT VARS AGAINST TIME AND SETTING Y-----------------------------

if n == 1
    
    A0 = a0/a1;
    B0 = b0/a1;
    B1 = b1/a1;
    
    for K = 5:Ns
        x1(K)=((B0-B1*A0)*u(K)+((x1(K-1))/(T)))/((1/T)+A0);
        Y (K)=x1(K-1)+ B1*u(K);
    end
    
    axes(handles.Var_plot);
    axis on
    grid on
%    xlabel ('time')
%    ylabel ('X1')
%    title('T VS STATE VARIABLES')
    plot (time, x1, 'LineWidth', 1 )
    
end

%--------------------------------------------------------------------------
if n == 2
    
    A0 = a0/a2;
    A1 = a1/a2;
    B0 = b0/a2;
    B1 = b1/a2;
    B2 = b2/a2;
    
    for K = 5:Ns
        x1(K)=(T)*((x1(K-1))/(T)-A0*x2(K-1)+(B0-A0*B2)*u(K));
        x2(K)=((x1(K-1))+((B1-A1*B2)*(u(K)))+((x2(K-1))/(T)))/((1/T)+(A1));
        Y (K)=x2(K-1)+ B2*u(K);
    end
    
    axes(handles.Var_plot);
    axis on
    hold on
    grid on
%    xlabel ('time')
%    ylabel ('X1, X2')
%    title('T VS STATE VARIABLES')
    X1= plot (time, x1, 'LineWidth', 1 )
    X2= plot (time, x2, 'LineWidth', 1 ) 
    legend([X1,X2],'X1','X2', 'Location', 'Best' )

end 
%--------------------------------------------------------------------------
if n == 3
    
    A0 = a0/a3;
    A1 = a1/a3;
    A2 = a2/a3;
    B0 = b0/a3;
    B1 = b1/a3;
    B2 = b2/a3;
    B3 = b3/a3;
    
    for K = 5:Ns
        x1(K)=(T)*(((x1(K-1))/(T))-(A0*x3(K-1))+((B0-B3*A0)*(u(K))));
        x2(K)=(T)*(((x2(K-1))/(T))-(A1*x3(K-1))+((B1-B3*A1)*(u(K)))+(x1(K-1)));
        x3(K)=    (((x3(K-1))/(T))             +((B2-B3*A2)*(u(K)))+(x2(K-1)))/(((1)/(T))+(A2));
        Y (K)=(x3(K-1))+(B3*u(K));
    end
    
    axes(handles.Var_plot);
    axis on
    hold on
    grid on
%    xlabel ('time')
%    ylabel ('X1, X2, X3')
%    title('T VS STATE VARIABLES')
    X1= plot (time, x1, 'LineWidth', 1 )
    X2= plot (time, x2, 'LineWidth', 1 )
    X3= plot (time, x3, 'LineWidth', 1 )
    legend([X1,X2,X3],'X1','X2','X3', 'Location', 'Best' )
    
end
%--------------------------------------------------------------------------
if n == 4
    
    A0 = a0/a4;
    A1 = a1/a4;
    A2 = a2/a4;
    A3 = a3/a4;
    B0 = b0/a4;
    B1 = b1/a4;
    B2 = b2/a4;
    B3 = b3/a4;
    B4 = b4/a4;

    for K = 5:Ns
        
%        x1 (K)  = (T)*(((x1(K-1))/(T))-(A0*x4(K-1))+((B0-B4*A0)*(u(K))));
%        x2 (K)  = (T)*(((x2(K-1))/(T))-(A1*x4(K-1))+((B1-B4*A1)*(u(K)))+(x1(K-1)));
%        x3 (K)  = (T)*(((x3(K-1))/(T))-(A2*x4(K-1))+((B2-B4*A2)*(u(K)))+(x2(K-1)));
%        x4 (K)  =     (((x4(K-1))/(T))+  (x3(K-1)) +((B3-B4*A3)*(u(K))))/(((1)/(T))+(A3));
%        Y  (K)  = x4(K-1)+ (B4*u(K));


        x1(K)=(T)*(((x1(K-1))/(T))          -(A0*(x4(K-1)))+((B0-(A0*B4))*(u(K))));
        x2(K)=(T)*(((x2(K-1))/(T))+(x1(K-1))-(A1*(x4(K-1)))+((B1-(A1*B4))*(u(K))));        
        x3(K)=(T)*(((x3(K-1))/(T))+(x2(K-1))-(A2*(x4(K-1)))+((B2-(A2*B4))*(u(K))));     
        x4(K)=    (((x4(K-1))/(T))+(x3(K-1))               +((B3-(A3*B4))*(u(K))))/(((1)/(T))+(A3));
    
        Y (K)=(x4(K-1))+(B4*u(K));
        
    end
    axes(handles.Var_plot);
    axis on
    hold on
    grid on
%    xlabel ('time')
%    ylabel ('X1, X2, X3')
%    title('T VS STATE VARIABLES')
    X1= plot (time, x1, 'LineWidth', 1 )
    X2= plot (time, x2, 'LineWidth', 1 )
    X3= plot (time, x3, 'LineWidth', 1 )
    X4= plot (time, x4, 'LineWidth', 1 )
    legend([X1,X2,X3,X4],'X1','X2','X3','X4', 'Location', 'Best' )
    
end

%PLOTTING OUTPUT (Y) AND INPUT (U) AGAINGST TIME---------------------------

axes(handles.Y_plot);
axis on
hold on
grid on
%xlabel ('time')
%ylabel ('Y')
%title('Output (Y)')
plot(time, Y);

axes(handles.U_plot);
axis on
hold on
grid on
%xlabel ('time')
%ylabel ('U')
%title('Output (U)')
plot(time, u, 'LineWidth', 3 );

%SETTING MATRICES FOR DISPLAY----------------------------------------------

if n==1
    A0 = a0/a1;
    B0 = b0/a1;
    B1 = b1/a1;
    A=[-1*A0]; 
    B=[(B0-(A0*B1))];    
    C=[1];    
    D=[B1];
end 

if n==2
    A0 = a0/a2;
    A1 = a1/a2;
    B0 = b0/a2;
    B1 = b1/a2;
    B2 = b2/a2;
    A=[0 (-1*A0) ;
       1 (-1*A1)]; 
    B=[(B0-(B2*A0)) ;
       (B1-(B2*A1))];  
    C=[0 1];   
    D=[B2];
end

if n==3
    A0 = a0/a3;
    A1 = a1/a3;
    A2 = a2/a3;
    B0 = b0/a3;
    B1 = b1/a3;
    B2 = b2/a3;
    B3 = b3/a3;
    A=[0 0 (-1*A0) ;
       1 0 (-1*A1) ;
       0 1 (-1*A2)];   
    B=[(B0-(B3*A0)) ;
       (B1-(B3*A1)) ;
       (B2-(B3*A2))]; 
    C=[0 0 1]; 
    D=[B3];
end

if n==4
    A0 = a0/a4;
    A1 = a1/a4;
    A2 = a2/a4;
    A3 = a3/a4;
    B0 = b0/a4;
    B1 = b1/a4;
    B2 = b2/a4;
    B3 = b3/a4;
    B4 = b4/a4; 
    A=[0 0 0 (-1*A0) ;
       1 0 0 (-1*A1) ; 
       0 1 0 (-1*A2) ; 
       0 0 1 (-1*A3)];  
    B=[(B0-(A0*B4)) ;
       (B1-(A1*B4)) ;
       (B2-(A2*B4)) ;
       (B3-(A3*B4))]; 
    C=[0 0 0 1];   
    D=[B4];
end
  
assignin('base','A',A)
assignin('base','B',B)
assignin('base','C',C)
assignin('base','D',D)

set(handles.mat_a, 'Data', A );
set(handles.mat_b, 'Data', B );
set(handles.mat_c, 'Data', C );
set(handles.mat_d, 'Data', D );



% hObject    handle to show_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
