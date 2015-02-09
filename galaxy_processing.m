% call: galaxy_processing.m
%
% Background subtraction by thresholding.  Threshold is determined
% by either manual inspection of threshold image iterations of the
% histogram levels or Otsu's method.  Star/object removal by morphological 
% opening.  Shift image so galaxy centroid and image center are coincident.
% Galaxy rotation by angle between 2nd moment and vertical image axis. 
% Crop and resize image to 128x128.  Edge detection and calculate best fit
% ellipse for use in feature extraction by 6 morphological features.
%% Read image in
clear all; close all; clc
A=imread('AC8431_NGC3985.tif');
[N M L]=size(A);
A=A(:,:,1);
%% Find best threshold
    H=imhist(A,65535); %imhist(A,65535) for uint16 images
    figure;
    subplot(2,2,1)
    imshow(A)
    subplot(2,2,[3,4])
    plot(H)
%  x1=1*10^4; % for uint16 images
for i=50:200
    subplot(2,2,[3,4])
    hold on;
    T=i;
    xx=[T T];
    yy=[0 H(T)];
    hline=line(xx,yy);
    set(hline,'Color',[1 0 0]);
    htext=text(T-5, H(T),'T');
    set(htext,'Color',[1 0 0]);
    Ab=(A>T);
    subplot(2,2,2)
    imshow(Ab)
    ss=sprintf('Thresholding by %g',T);
    stitle=title(ss);
    pause(.1)
    delete(htext); delete(hline);
end
% Thresholding
bw=im2bw(A,19200/65535);
bw=1-bw;
bw2=bwareaopen(bw,256);
% cc=bwconncomp(bw2); %use for more than 1 object
% L=labelmatrix(cc);
% L(L~=2)=0;
% L=double(L);
% imshow(L,[])
% X=double(A);
% g=L.*X;
imshow(bw2,[]); %colormap(gray(65535))
X=double(A);
g=bw2.*X;
imshow(g,[]); %colormap(gray(65535))
%% Shifting image by centroid
[xc,yc]=centroid(g,1);
Y=galaxy_shift(g,xc,yc);
%% Rotate image by angle defined by 2nd moments
[m11,m20,m02]=secondmoment(g);    
theta=(1/2)*atan2(2*m11,m20-m02);  
alpha=theta*(180/pi); 
gr=imrotate(g,angle); 
imshow(gr,[])
% Crop galaxy
% reduce size of rotated galaxy by size(gr)/n, n=1,2,...
% use the reduced size to compose a new image I which contains
% the galaxy.
I=imcrop(gr,[102 214 129 125]);
gs=imresize(I,[128 128]);
imshow(gs,[])
[N M L]=size(gs);
%% Calculating morphics features
bs=im2bw(gs);
p=regionprops(bs,'all');
p=p(1);
xc=p.Centroid(1);
yc=p.Centroid(2);
a=p.MajorAxisLength/2;
b=p.MinorAxisLength/2;
BBox=round(p.BoundingBox);
[X,Y]=calculateEllipse(p.Centroid(1),p.Centroid(2),a,b,0);
% Edge detection
[gCanny, gt]=edge(gs,'canny',[0.3 .9], 0.5);
imshow(gCanny)
G=find(gCanny>0);
figure;
imshow(gs,[]); hold on;
plot(X,Y,'b*');
rectangle('Position',p.BoundingBox,'EdgeColor','r')
plot(G,'g-');
% Elongation: (a-b)/(b+a).
Elongation=(a-b)/(b+a)
% Form Factor: ratio of the area of the galaxy 
% (number of pixels in the galaxy) to its perimeter 
% (number of pixels in canny edge detection).
numpixels_galaxy=0;
for n=1:N
    for m=1:M
        if(gs(n,m)~=0)
            numpixels_galaxy=numpixels_galaxy+1;
        end
    end
end
numpixels_perimeter=numel(find(gCanny>0));
Formfactor=numpixels_galaxy/(numpixels_perimeter)^2
% Convexity: ratio of the galaxy perimeter to the 
% perimeter of the minimum bounding rectangle.
% imshow(A) %show bounding rectangle superimposed on galaxy.
% rectangle('position',[xmin ymin width height],'EdgeColor','r');
rectangle_perimeter=2*BBox(3)+2*BBox(4);
Convexity=numpixels_perimeter/rectangle_perimeter
%Bounding-rectangle-to-fill-factor (BFF): area of the galaxy 
%to the number of pixels within the rectangle.
rectangle_area=BBox(3)*BBox(4);
L1=BBox(1);
W1=BBox(2);
L=BBox(1)+BBox(3);
W=BBox(2)+BBox(4);
numpixels_bounding_box=0;
for n=L1:L
    for m=W1:W
        numpixels_bounding_box=numpixels_bounding_box+1;
    end
end

BFF=numpixels_galaxy/rectangle_area
% Bounding-rectangle-to-perimeter: area of the bounding rectangle 
% to the square number of pixels included in the perimeter.
Bounding_rectangle_to_perimeter=rectangle_area/(rectangle_perimeter)^2
% Asymmetry index: taking the difference between the galaxy image 
% and the same image rotated 180 degrees about the center of the galaxy.  
% The sum of the absolute value of the pixels in the difference image 
% is divided by the sum of pixels in the original image to give the 
% asymmetry parameter.
gs_rotated=imrotate(gs,180);
difference_image=gs-gs_rotated;
Asymmetry_index=sum(sum(abs(difference_image)))/sum(sum(gs))

    
    
    
