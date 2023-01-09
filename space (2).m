function varargout = space(varargin)
% SPACE MATLAB code for space.fig
%      SPACE, by itself, creates a new SPACE or raises the existing
%      singleton*.
%
%      H = SPACE returns the handle to a new SPACE or the handle to
%      the existing singleton*.
%
%      SPACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPACE.M with the given input arguments.
%
%      SPACE('Property','Value',...) creates a new SPACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before space_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to space_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help space

% Last Modified by GUIDE v2.5 09-Jun-2022 13:56:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @space_OpeningFcn, ...
                   'gui_OutputFcn',  @space_OutputFcn, ...
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


% --- Executes just before space is made visible.
function space_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to space (see VARARGIN)

% Choose default command line output for space
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes space wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = space_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
n=str2num(get(handles.n,'string'))
set(handles.matrix,'data',rand(n))
x=get(handles.matrix,'data');
x=cell(n,n)
set(handles.matrix,'data',x);

% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
n=str2num(get(handles.n,'string'));
x =get(handles.matrix,'data');
r1=getappdata(0,'r')
x=str2double(x);
for i=1:n
    for j=r1:n
        x(i,j)=randi([1,5]);
    end
end
set(handles.matrix,'data',x)
Det=det(x);
set(handles.sol,'string',Det)
if Det==0
          set(handles.i,'string','The vectors are dependent')
else
          set(handles.i,'string',' ')
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sol_Callback(hObject, eventdata, handles)
% hObject    handle to sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sol as text
%        str2double(get(hObject,'String')) returns contents of sol as a double


% --- Executes during object creation, after setting all properties.
function sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in c.
function c_Callback(hObject, eventdata, handles)
n=str2num(get(handles.n,'string'));
x =get(handles.matrix,'data');
for i=1:n
        z=isempty(x{1,i});
        if z==1
            r=i;
            break
        end
end

setappdata(0,'r',r);
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
