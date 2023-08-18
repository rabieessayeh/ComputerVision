function varargout = tp1(varargin)
% TP1 MATLAB code for tp1.fig
%      TP1, by itself, creates a new TP1 or raises the existing
%      singleton*.
%
%      H = TP1 returns the handle to a new TP1 or the handle to
%      the existing singleton*.
%
%      TP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1.M with the given input arguments.
%
%      TP1('Property','Value',...) creates a new TP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tp1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tp1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tp1

% Last Modified by GUIDE v2.5 08-Jan-2023 17:38:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tp1_OpeningFcn, ...
                   'gui_OutputFcn',  @tp1_OutputFcn, ...
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


% --- Executes just before tp1 is made visible.
function tp1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tp1 (see VARARGIN)

% Choose default command line output for tp1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tp1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tp1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Ouvrir.
function Ouvrir_Callback(hObject, eventdata, handles)
% hObject    handle to Ouvrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*');
handles.ima = imread(sprintf('%s',path,file));
axes(handles.imgO)
handles.courant_data = handles.ima;
subimage(handles.courant_data);
axes(handles.imgT)
% handles.ima_traite = 0;
% subimage(handles.ima_traite);

subimage(handles.courant_data);

handles.output = hObject;
guidata(hObject, handles);

% --- Executes on button press in Enregistrer.
function Enregistrer_Callback(hObject, eventdata, handles)
% hObject    handle to Enregistrer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image = handles.courant_data;
[file,path] = uiputfile('*.png','Enregistrer Votre Image ...');
imwrite(image, sprintf('%s',path,file),'png');



% --- Executes on button press in Quiter.
function Quiter_Callback(hObject, eventdata, handles)
% hObject    handle to Quiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1)



% --- Executes on button press in Mediane.
function Mediane_Callback(hObject, eventdata, handles)
% hObject    handle to Mediane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       sort(v);
       a=median(v);
       img(i,j)=a;
    end
end
b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --- Executes on button press in Gaussien.
function Gaussien_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussien (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Fichier_Callback(hObject, eventdata, handles)
% hObject    handle to Fichier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Filtre_Pass_Bas_Callback(hObject, eventdata, handles)
% hObject    handle to Filtre_Pass_Bas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Filtre_Pass_Haut_Callback(hObject, eventdata, handles)
% hObject    handle to Filtre_Pass_Haut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gradient_Callback(hObject, eventdata, handles)
% hObject    handle to Gradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Inversion_Callback(hObject, eventdata, handles)
% hObject    handle to Inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image = double(image);
[l c]=size(image);
image = double(image);
v=image;
for i=1:l
   for j=1:c
     v(i,j)=-double(image(i,j))+255;
    end
 end 

v=uint8(v); 
axes(handles.imgT);
subimage(v);




% --------------------------------------------------------------------
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.courant_data;

        d = length(size(img));
        if d==3
            I = rgb2gray(img);
        elseif d==2
            I = img
        end
axes(handles.imgO);
subimage(I);


[nl nc]=size(I);
v=double(I);
vec=[1:256];
l=0;
for k=0:255 
    for i=1:nl
        for j=1:nc
            if v(i,j)==k 
               l=l+1;
            end
        end
    end
    vec(k+1)=l;
    l=0;
end
axes(handles.imgT);plot(vec);


% --------------------------------------------------------------------
function D_3_3_Callback(hObject, eventdata, handles)
% hObject    handle to D_3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       img(i,j)=a;
    end
end
b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function D_5_5_Callback(hObject, eventdata, handles)
% hObject    handle to D_5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image
for i=3:n-2
    for j=3:m-2
       fenetre=image(i-2:i+2,j-2:j+2);
       v=[fenetre(1,:) fenetre(2,:)  fenetre(3,:) fenetre(4,:) fenetre(5,:)];
       a=max(v);
       img(i,j)=a;
    end
end
b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);



% --------------------------------------------------------------------
function Gaussiene_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussiene (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageO=handles.courant_data;
Imgb =imnoise(imageO,'gaussian', 0,0.01);
%Imgb=handles.Imgb;
axes(handles.imgT)
imshow(Imgb);
handles.courant_data=Imgb;
%subImage(handles.Imgb);
handles.output=hObject;
guidata(hObject,handles);



% --------------------------------------------------------------------
function Poivre_sele_Callback(hObject, eventdata, handles)
% hObject    handle to Poivre_sele (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imageO=handles.courant_data;
Imgb =imnoise(imageO,'Salt & Pepper', 0.01);
%Imgb=handles.Imgb;
axes(handles.imgT)
%
imshow(Imgb);
handles.courant_data=Imgb;
%subImage(handles.Imgb);
handles.output=hObject;
guidata(hObject,handles);





% --------------------------------------------------------------------
function Gaussian_3_3_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.courant_data;
[n,m]=size(image);
image = double(image);
b=image;
H=(1/16)*[1 2 1 ;2 4 2 ; 1 2 1];
for x = 2 : n-1
    for y = 2 : m-1
    f=image(x-1:x+1,y-1:y+1);
      v=f.*H;
      b(x,y)=sum(v(:));
    end 
end
b=uint8(b);
axes(handles.imgT);
subimage(b);
handles.ima_traite = b;
handles.output = hObject;
guidata(hObject, handles);




% --------------------------------------------------------------------
function Gaussian_5_5_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
[n,m]=size(image);
image = double(image);
b=image;
H=(1/256)*[1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 36 24 6 ; 4 16 24 16 4 ; 1 4 6 4 1];
for x = 3 : n-2
    for y = 3 : m-2
  f=image(x-2:x+2,y-2:y+2);
      v=f.*H;
      b(x,y)=sum(v(:));
    end 
end
b=uint8(b);
axes(handles.imgT);
subimage(b);
handles.ima_traite = b;
handles.output = hObject;
guidata(hObject, handles);




% --------------------------------------------------------------------
function Moyenne_3_3_Callback(hObject, eventdata, handles)
% hObject    handle to Moyenne_3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
[n,m]=size(image);
image = double(image);
b=image;
H=(1/9)*[1 1 1 ; 1 1 1 ; 1 1 1 ];
for x = 2 : n-1
    for y = 2 : m-1
     %img(x,y)=mean([image(x-1,y-1)+image(x-1,y)+image(x-1,y+1)+image(x,y-1)+image(x,y)+image(x,y+1)+image(x+1,y-1)+image(x+1,y)+image(x+1,y+1)]);
      f=image(x-1:x+1,y-1:y+1);
      v=f.*H;
      %b=conv2(img,H);
      b(x,y)=sum(v(:));
      %b(x,y)=mean(f(:));
    end 
end
b=uint8(b);
%imshow(b);
axes(handles.imgT);
subimage(b);


% --------------------------------------------------------------------
function Moyenne_5_5_Callback(hObject, eventdata, handles)
% hObject    handle to Moyenne_5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
[n,m]=size(image);
image = double(image);
b=image;
H=(1/25)*[1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1];
for x = 3 : n-2
    for y = 3 : m-2
     f=image(x-2:x+2,y-2:y+2);
      v=f.*H;
      b(x,y)=sum(v(:));
    end 
end
b=uint8(b);
axes(handles.imgT);
     subimage(b);
handles.ima_traite = b;
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image = double(image);

[l, c]=size(image);
image = double(image);
v=image;

mi = min(image);
ma = max(image);
seuil = ma-mi;

for i=1:l
    for j=1:c
        if(v(i, j)< seuil)
            v(i, j) = 0;
        else
            v(i, j) = 255;
        end
    end
end


v=uint8(v); 
axes(handles.imgT);
subimage(v);


% --------------------------------------------------------------------
function Luminosite_Callback(hObject, eventdata, handles)
% hObject    handle to Luminosite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
[l c]=size(image);
image = double(image);
v=image;
for i=1:l
    for j=1:c
        pix=image(i,j)+50;
         if(pix>255)
            pix=255;
         else if (pix<0)
                pix=0;
             
              end 
          end
       v(i,j)=pix;    
    end
end  
v=uint8(v); 
axes(handles.imgT);
subimage(v);



% --------------------------------------------------------------------
function Amiliorer_Callback(hObject, eventdata, handles)
% hObject    handle to Amiliorer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;

d = length(size(image));
if d==3
    I = rgb2gray(image);
elseif d==2
    I = img;
end
        
image = rgb2gray(image);

A = double(min(min(image)));
B = double(max(max(image)));

P = (255-0)/(B-A);
L = -P*A;

image = P*double(image)+L;

v=uint8(image); 
axes(handles.imgT);
subimage(v);


% --------------------------------------------------------------------
function Erosion_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Dilatation_Callback(hObject, eventdata, handles)
% hObject    handle to Dilatation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function E_3_3_Callback(hObject, eventdata, handles)
% hObject    handle to E_3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       img(i,j)=a;
    end
end
b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function E_5_5_Callback(hObject, eventdata, handles)
% hObject    handle to E_5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image
for i=3:n-2
    for j=3:m-2
       fenetre=image(i-2:i+2,j-2:j+2);
       v=[fenetre(1,:) fenetre(2,:)  fenetre(3,:) fenetre(4,:) fenetre(5,:)];
       a=min(v);
       img(i,j)=a;
    end
end
b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Morphlogie_Mat_Callback(hObject, eventdata, handles)
% hObject    handle to Morphlogie_Mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Ouverture_Callback(hObject, eventdata, handles)
% hObject    handle to Ouverture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.courant_data;
image=double(image);
[n, m]=size(image);
img=image;

%Erosion
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       img(i,j)=a;
    end
end

%Dilatation
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       img(i,j)=a;
    end
end

b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Fermeture_Callback(hObject, eventdata, handles)
% hObject    handle to Fermeture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


image=handles.courant_data;
image=double(image);
[n, m]=size(image)
img=image

%Dilatation
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       img(i,j)=a;
    end
end

%Erosion
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       img(i,j)=a;
    end
end

b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Contour_O_Callback(hObject, eventdata, handles)
% hObject    handle to Contour_O (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


image=handles.courant_data;
image=double(image);
[n, m]=size(image);
img=image;
Image_C=image;

%Erosion
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       img(i,j)=a;
    end
end

%Dilatation
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       img(i,j)=a;
    end
end



for i=1:n
    for j=1:m
       Image_C(i, j) = img(i, j)- image(i, j);
       
       if (Image_C(i, j)<0)
           Image_C(i, j) = 0;
       end
       if (Image_C(i, j)> 255)
               Image_C(i, j) = 255;
       end
       
    end
end


b=uint8(Image_C);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);

% --------------------------------------------------------------------
function Contour_F_Callback(hObject, eventdata, handles)
% hObject    handle to Contour_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


image=handles.courant_data;
image=double(image);
[n, m]=size(image);
img=image;
Image_C=image;

%Dilatation
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       img(i,j)=a;
    end
end

%Erosion
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       img(i,j)=a;
    end
end


for i=1:n
    for j=1:m
       Image_C(i, j) = image(i, j)- img(i, j);
       
       if (Image_C(i, j)<0)
           Image_C(i, j) = 0;
       end
       if (Image_C(i, j)> 255)
               Image_C(i, j) = 255;
       end
       
    end
end


b=uint8(Image_C);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Contour__D_E_Callback(hObject, eventdata, handles)
% hObject    handle to Contour__D_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image=handles.courant_data;
image=double(image);
[n, m]=size(image);
img = image;
image_E=image;
image_D=image;


%Dilatation
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=max(v);
       image_D(i,j)=a;
    end
end

%Erosion
for i=2:n-1
    for j=2:m-1
       fenetre=image(i-1:i+1,j-1:j+1);
       v=[fenetre(1,:) fenetre(2,:) fenetre(3,:)];
       a=min(v);
       image_E(i,j)=a;
    end
end


for i=1:n
    for j=1:m
       img(i, j) = image_D(i, j)- image_E(i, j);
       
       if (img(i, j)<0)
           img(i, j) = 0;
       end
       if (img(i, j)> 255)
               img(i, j) = 255;
       end
       
    end
end


b=uint8(img);
handles.ima_traite = b;
axes(handles.imgT);
subimage(b);
handles.output = hObject;
guidata(hObject, handles);
