% call: galaxy_features.m
%
% galaxy feature extraction

clear all; close all; clc
s_dir=pwd;
cd banksmall
A=imread('AC8409_NGC4274_small.tif');
[N M]=size(A);
cd(s_dir)

%% Canny edge detection.
[gCanny, gt]=edge(A,'canny',[0.2 0.9], 3.5);
r=regionprops(gCanny,'all');

%% Calculating the major and minor axis of "ellipse" by Centroid.
[a b centroid bounding_box]=majminaxes(gCanny);

%% Morphic features
%Elongation: (a-b)/(b+a).
Elongation=(a-b)/(b+a)

%Form Factor: ratio of the area of the galaxy 
%(number of pixels in the galaxy) to its perimeter 
%(number of pixels in canny edge detection).
numpixels_galaxy=0;
for n=1:N
    for m=1:M
        if(A(n,m)~=0)
            numpixels_galaxy=numpixels_galaxy+1;
        end
    end
end
numpixels_perimeter=numel(find(gCanny>0));
Formfactor=numpixels_galaxy/numpixels_perimeter

%Convexity: ratio of the galaxy perimeter to the 
%perimeter of the minimum bounding rectangle.
% imshow(A) %show bounding rectangle superimposed on galaxy.
% rectangle('position',[xmin ymin width height],'EdgeColor','r');
rectangle_perimeter=2*a+2*b;
Convexity=numpixels_perimeter/rectangle_perimeter

%Bounding-rectangle-to-fill-factor (BFF): area of the bounding rectangle 
%to the number of pixels within the rectangle.
rectangle_area=a*b;
L1=bounding_box(1);
W1=bounding_box(2);
L=bounding_box(1)+a;
W=bounding_box(2)+b;
numpixels_bounding_box=0;
for n=L1:L
    for m=W1:W
        numpixels_bounding_box=numpixels_bounding_box+1;
    end
end
BFF=rectangle_area/numpixels_bounding_box

%Bounding-rectangle-to-perimeter: area of the bounding rectangle 
%to the number of pixels included in the perimeter.
Bounding_rectangle_to_perimeter=rectangle_area/rectangle_perimeter

%Asymmetry index: taking the difference between the galaxy image 
%and the same image rotated 180 degrees about the center of the galaxy.  
%The sum of the absolute value of the pixels in the difference image 
%is divided by the sum of pixels in the original image to give the 
%asymmetry parameter.
A_rotated=imrotate(A,180);
difference_image=A-A_rotated;
Asymmetry_index=sum(sum(abs(difference_image)))/sum(sum(A))

%display galaxy name and morphic feature values
% disp('%g %g %g %g %g %g %g',A, Elongation, Convexity, BFF,...
%     Bounding_rectangle_to_perimeter, Asymmetry_index)









