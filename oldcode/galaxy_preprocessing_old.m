%galaxy image preprocessing
clear all; close all; clc;
s_dir=pwd;
cd banksmall
A=imread('S0T68small.tif');
cd(s_dir)
%% Rotating galaxy by angle computed from 2nd moments
[m11 m20 m02]=secondmoment(A);
theta=(1/2)*atan2(2*m11, m20-m02);% =1.5707
theta_degrees=180*theta/pi;% =89.9946
Arotated=imrotate(A,theta_degrees);
%% Rotating galaxy by 1st principal component
A=1-A;%negative of logical image A.
CC=bwconncomp(A,8);%8 is the value of connectivity.
L=labelmatrix(CC);%returns label matrix from connected ...
%components structure in bwconncomp.
L(L==3)=1;%set region 3 to value 0(background).
for i=2:max(L(:))
L(L==i)=1;
end
L=double(L);
%Calculate the two principal components of the image.
[signals,PC,V]=pca1(L);
PC1=PC(:,1);
bb=[1,zeros(1,82)]';
angle=acos(dot(PC1,bb)/norm(PC1)*norm(bb));
angle=180*angle/pi;% =90
Lrotated=imrotate(L,angle);

figure;
subplot(1,3,1)
imshow(A)
title('original image')
subplot(1,3,2)
imshow(Arotated)
title('image rotated by 2nd moments')
subplot(1,3,3)
imshow(Lrotated)
title('image rotated by 1st principal component')
