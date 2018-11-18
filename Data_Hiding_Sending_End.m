function varargout = Data_Hiding_Sending_End(varargin)
% DATA_HIDING_SENDING_END MATLAB code for Data_Hiding_Sending_End.fig
%      DATA_HIDING_SENDING_END, by itself, creates a new DATA_HIDING_SENDING_END or raises the existing
%      singleton*.
%
%      H = DATA_HIDING_SENDING_END returns the handle to a new DATA_HIDING_SENDING_END or the handle to
%      the existing singleton*.
%
%      DATA_HIDING_SENDING_END('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_HIDING_SENDING_END.M with the given input arguments.
%
%      DATA_HIDING_SENDING_END('Property','Value',...) creates a new DATA_HIDING_SENDING_END or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_Hiding_Sending_End_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_Hiding_Sending_End_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_Hiding_Sending_End

% Last Modified by GUIDE v2.5 16-Nov-2018 18:55:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_Hiding_Sending_End_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_Hiding_Sending_End_OutputFcn, ...
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


% --- Executes just before Data_Hiding_Sending_End is made visible.
function Data_Hiding_Sending_End_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_Hiding_Sending_End (see VARARGIN)

% Choose default command line output for Data_Hiding_Sending_End
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_Hiding_Sending_End wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_Hiding_Sending_End_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sequence_Callback(hObject, eventdata, handles)
% hObject    handle to sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sequence as text
%        str2double(get(hObject,'String')) returns contents of sequence as a double


% --- Executes during object creation, after setting all properties.
function sequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function counts_Callback(hObject, eventdata, handles)
% hObject    handle to counts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of counts as text
%        str2double(get(hObject,'String')) returns contents of counts as a double


% --- Executes during object creation, after setting all properties.
function counts_CreateFcn(hObject, eventdata, handles)
% hObhandle to counts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in compression.
function compression_Callback(hObject, eventdata, handles)
% hObject    handle to compression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1=get(handles.sequence,'String');
set(handles.text16,'String',length(s1));
%s1=strsplit(s1);
%s1=str2double(s1);
%s2=get(handles.counts,'String');
%s2=strsplit(s2);
%s2=str2double(s2);
%m1=arithencrypt(s1,s2,handles);
s2=uint8(s1);
x2=de2bi(s2)
abc=size(x2)
a1=1;
for i=abc
    a1=a1*i;
end
x2=reshape(x2,1,a1);
x2=num2str(x2);


set(handles.compressed_text,'String',x2)

% --- Executes on button press in aes_encryption.
function aes_encryption_Callback(hObject, eventdata, handles)
% hObject    handle to aes_encryption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%s1=get(handles.sequence,'String');
%s1=strsplit(s1);
%s1=str2double(s1);
%s2=get(handles.counts,'String');
%s2=strsplit(s2);
%s2=str2double(s2);
%m1=arithencrypt(s1,s2,handles);
s1=get(handles.sequence,'String');
s2=uint8(s1);
x2=de2bi(s2)
abc=size(x2);
a1=1;
for i=abc
    a1=a1*i;
end
x2=reshape(x2,1,a1);
key='Bishwas';
reps=7;
s=encrypt(x2,reps,key);
ax=size(s);
in=1;
for i=ax
    in=in*i;
end
new_size=in;
n=reshape(s,1,new_size);
m=int2str(n);

%denoting in alphabets
m=strrep(m,'1','a');
m=strrep(m,'2','b');
m=strrep(m,'3','c');
m=strrep(m,'4','d');
m=strrep(m,'5','e');
m=strrep(m,'6','f');
m=strrep(m,'7','g');
m=strrep(m,'8','h');
m=strrep(m,'9','i');
m=strrep(m,'0','j');
m=strrep(m,' ','x');



%code to save in basic.txt file
fid = fopen('AES_encrypted.txt', 'wt');
fprintf(fid,m);
fclose(fid);

%code to save in AES_encrypted.txt file

set(handles.encrypted_text,'String',m)
    


% --- Executes on button press in browse_image.
function browse_image_Callback(hObject, eventdata, handles)
% hObject    handle to browse_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 handles.myImage = strcat(pathname, filename);
 axes(handles.axes1);
 imshow(handles.myImage)
 % save the updated handles object
 guidata(hObject,handles);

% --- Executes on button press in embed_data.
function embed_data_Callback(hObject, eventdata, handles)
% hObject    handle to embed_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'myImage')
     img=handles.myImage;
     text='AES_encrypted.txt';
     out='stego_image.png';
     embed(img,text,out);
     IJK=imread('stego_image.png');
     axes(handles.axes2);
     imshow(IJK)
     
 end


% --- Executes on button press in psnr_button.
function psnr_button_Callback(hObject, eventdata, handles)
% hObject    handle to psnr_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
in=imread(handles.myImage);
o=imread('stego_image.png');

[row col] = size(o);

original=double(in);
target=double(o);
mse = 0;
for i=1:row
    for j=1:col
        d1=target(i,j);
        
        d2=original(i,j);
        
        mse=mse+(d1-d2)^2;
    end
end
mse=mse/(row*col);
k=10*log10((255^2)/mse);
set(handles.psnr_txt,'String',k)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g=imread(handles.myImage);
red=g( : , : , 1);
green=g( : , : , 2);
blue=g( : , : , 3);
h=cat(2,red,green,blue);
axes(handles.axes3);
imhist(h,255)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g=imread('stego_image.png');
red=g( : , : , 1);
green=g( : , : , 2);
blue=g( : , : , 3);
h=cat(2,red,green,blue);
axes(handles.axes4);
imhist(h,255)


% --- Executes on button press in hiding_capacity.
function hiding_capacity_Callback(hObject, eventdata, handles)
% hObject    handle to hiding_capacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.myImage;
y=capacity(x,handles);
set(handles.text17,'String',y);


% --- Executes on button press in mse_.
function mse__Callback(hObject, eventdata, handles)
% hObject    handle to mse_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=imread(handles.myImage);
y=imread('stego_image.png');
m=mse(x,y);
i1=0;
for i=m
    i1=i1+i
end
i=i/3;
set(handles.text19,'String',i);