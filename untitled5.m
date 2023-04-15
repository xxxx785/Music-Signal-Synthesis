function varargout = untitled5(varargin)
% UNTITLED5 MATLAB code for untitled5.fig
%      UNTITLED5, by itself, creates a new UNTITLED5 or raises the existing
%      singleton*.
%
%      H = UNTITLED5 returns the handle to a new UNTITLED5 or the handle to
%      the existing singleton*.
%
%      UNTITLED5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED5.M with the given input arguments.
%
%      UNTITLED5('Property','Value',...) creates a new UNTITLED5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled5

% Last Modified by GUIDE v2.5 12-Apr-2023 22:57:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled5_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled5_OutputFcn, ...
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
end

% --- Executes just before untitled5 is made visible.
function untitled5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled5 (see VARARGIN)

% Choose default command line output for untitled5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 ii=imread('keqing.jpg');
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');
end

% --- Outputs from this function are returned to the command line.
function varargout = untitled5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 在GUI中创建一个按钮，用于选择文件并读取内容
%

% 定义一个回调函数，该函数将使用uigetfile函数选择文件并读取其内容

    [filename, pathname] = uigetfile({'*.wav';'*.mat'},'Select File');
    
    % 如果用户取消了选择文件，则退出函数
  if isequal(filename,0)

else
   handles.audioFilePath = fullfile(pathname, filename);
   

end
guidata(hObject, handles);
end
% --- Executes on button press in pushbutton2.
% --- Executes on selection change in popupmenu1.

% --- Executes during object creation, after setting all properties.

% --- Executes on button press in pushbutton3.


% --- Executes during object creation, after setting all properties.

function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('按下');
a = handles.uibuttongroup1.SelectedObject.Tag;
disp(a)
switch a
        
    case 'radiobutton2'
        disp('single_echo时间域图像');
      single_echo;
    case 'radiobutton3'
        disp('multi_echo时间图像');
       multi_echo;
    case 'radiobutton4'
        disp('recorded_audio时间图像');
        recorded_audio;
    case 'radiobutton5'
        disp('原音频信号的FFT');
      FFT;
    case 'radiobutton6'
        disp('原音频信号');
      initial_t;
    case 'radiobutton7'
        disp('原音频信号频域');
        initial;
     case 'radiobutton8'
        disp('single_echo频域图像');
      single_echo_t;
    case 'radiobutton9'
        disp('multi_echo频域图像');
       multi_echo_p;
    case 'radiobutton10'
        disp('recorded_audio频域图像');
        recorded_audio_p;
     case 'radiobutton11'
          getsound;
end
end


% --- Executes on button press in radiobutton11.

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
