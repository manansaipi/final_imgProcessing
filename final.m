
function varargout = final(varargin)

% FINAL MATLAB code for final.fig
%      F    INAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 09-Dec-2022 15:54:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;

gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles)

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ImportButton.
function ImportButton_Callback(hObject, eventdata, handles)

% hObject    handle to ImportButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile();
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);
setappdata(0,'filename',a);
plot(handles.axes1,'a');






% --- Executes on selection change in ChangeColor.
function ChangeColor_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ChangeColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChangeColor
contents=cellstr(get(hObject, 'String'));
pop_choice=contents{get(hObject, 'Value')};
pop_choice
global savedImage;
if (strcmp(pop_choice, '1. Black and White'));
    a=getappdata(0,'a');
    a_bw=im2bw(a,.57);
    axes(handles.axes2);
    imshow(a_bw);
    setappdata(0,'filename',a_bw);
    savedImage=a_bw;
elseif(strcmp(pop_choice, '2. Grey'));
    a=getappdata(0,'a');
    a_gray=rgb2gray(a);
    setappdata(0,'filename', a_gray);
    axes(handles.axes2);
    imshow(a_gray);
    savedImage=a_gray;
elseif(strcmp(pop_choice, '3. Red'));
    a=getappdata(0,'a');
    red=a;
    red(:,:,2:3)=0;
    setappdata(0,'filename', red);
    setappdata(0,'ImRotation', red);
    axes(handles.axes2);
    imshow(red);
      savedImage=red;
elseif(strcmp(pop_choice, '4. Green'));
    a=getappdata(0,'a');
    green=a;
    green(:,:,1)=0;
    green(:,:,3)=0;
    setappdata(0,'filename', green);
    setappdata(0,'ImRotation', green);
    axes(handles.axes2);
    imshow(green);
    savedImage=green;
elseif(strcmp(pop_choice, '5. Blue'));
    a=getappdata(0,'a');
    blue=a;
    blue(:,:,1)=0;
    blue(:,:,2)=0;
    setappdata(0,'filename', blue);
    setappdata(0,'ImRotation', blue);
    axes(handles.axes2);
    imshow(blue);
    savedImage=blue;
else
    a=getappdata(0,'a');
    imshow(a);
    savedImage=a;
end


% --- Executes during object creation, after setting all properties.
function ChangeColor_CreateFcn(hObject, eventdata, handles)
global savedImage;
% hObject    handle to ChangeColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Flip.
function Flip_Callback(hObject, eventdata, handles)
% hObject    handle to Flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Flip contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Flip
contents=cellstr(get(hObject, 'String'));
pop_choice=contents{get(hObject, 'Value')};
pop_choice
global savedImage;
if (strcmp(pop_choice, '1. Flip Horizontal'));
   I=getappdata(0,'a');
    I2=flipdim(I,2);
    axes(handles.axes2);
    imshow(I2);
    savedImage=I2;

elseif(strcmp(pop_choice, '2. Flip Vertical'));
  I=getappdata(0,'a');
    I3=flipdim(I,1);
    axes(handles.axes2);
    imshow(I3);
    savedImage=I3;

elseif(strcmp(pop_choice, '3. Flip Horizontal-Vertical'));
    I=getappdata(0,'a');
    I2=flipdim(I,2);
    I3=flipdim(I,1);
    I4=flipdim(I3,2);
    axes(handles.axes2);
    imshow(I4);
    savedImage=I4;

else
    a=getappdata(0,'a');
    imshow(a);
    savedImage=a;
end

% --- Executes during object creation, after setting all properties.
function Flip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate.



% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global savedImage;
imwrite(savedImage, 'edited_image.jpg')


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global savedImage;
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);
savedImage=input;


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glo bal savedImage;
a=getappdata(0,'a');
imshow(a);
savedImage=a;

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(1);
close();
close();

% --- Executes on selection change in Noise.
function Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Noise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Noise
contents=cellstr(get(hObject, 'String'));
pop_choice=contents{get(hObject, 'Value')};
pop_choice
global savedImage;
if (strcmp(pop_choice, '1. Periodic Noise'));
    a=getappdata(0,'a');
    s=size(a);
    [x,y]=meshgrid(1:s(1),1:s(2));
    p=sin(x/3+y/5)+1;
    noise=(im2double(a)+p/2)/2;
    axes(handles.axes2);
    imshow(noise);
    savedImage=noise;

elseif(strcmp(pop_choice, '2. Salt and Papper Noise'));
    a=getappdata(0,'a');
    noise=imnoise(a, 'salt & pepper');
    axes(handles.axes2);
    imshow(noise);
    savedImage=noise;

elseif(strcmp(pop_choice, '3. Gaussian Noise'));
    a=getappdata(0,'a');
    noise=imnoise(a, 'gaussian');
    axes(handles.axes2);
    imshow(noise);
    savedImage=noise;

else
    a=getappdata(0,'a');
    imshow(a);
    savedImage=a;
end

% --- Executes during object creation, after setting all properties.
function Noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Other.
function Other_Callback(hObject, eventdata, handles)
% hObject    handle to Other (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Other contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Other
contents=cellstr(get(hObject, 'String'));
pop_choice=contents{get(hObject, 'Value')};
pop_choice
global savedImage;
if (strcmp(pop_choice, '1. Complement of Image'));
    a=getappdata(0,'a');
    IM2=imcomplement(a);
    axes(handles.axes2);
    imshow(IM2);
    savedImage=IM2;

elseif(strcmp(pop_choice, '2. Edge Detection-Canny'));
    I=getappdata(0,'a');
    I=rgb2gray(I);
    BW2=edge(I,'canny');
    axes(handles.axes2);
    imshow(BW2);
    savedImage=BW2;

elseif(strcmp(pop_choice, '3. Edge Detection-Sobel'));
    I=getappdata(0,'a');
    I=rgb2gray(I);
    BW1=edge(I,'sobel');
    axes(handles.axes2);
    imshow(BW1);
    savedImage=BW1;

else
    a=getappdata(0,'a');
    imshow(a);
    savedImage=a;
end


% --- Executes during object creation, after setting all properties.
function Other_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Other (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
