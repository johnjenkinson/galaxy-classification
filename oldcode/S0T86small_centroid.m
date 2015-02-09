clear all; close all; clc;
%%this section below is for use on my personal file system.
s_dir=pwd;
cd banksmall
bw=imread('S0T68small.tif');
cd ..
%%
[P Q]=size(bw);
bw=1-bw;
% N=8;%connectivity of components in the image bw.
% [L,NUM]=bwlabel(bw,N);%default value of N is 8 for bwlabel.
% %L is a matrix of objects labels.  size(L)==size(bw).
% %NUM is the number of connected objects found in bw.
CC=bwconncomp(bw,8);%8 is the value of connectivity.
L=labelmatrix(CC);%returns label matrix from connected ...
%components structure in bwconncomp.
L(L==3)=1;%set region 3 to value 0(background).
for i=2:max(L(:))
L(L==i)=1;
end
whos L L2 L2new
figure, h=imshow(label2rgb(L));%convert label matrix to rgb ...
%color image and display
hp=impixelinfo(h);
S=regionprops(L,'Centroid')
[r,c]=find(L);
L=double(L);
%Calculate the two principal components of the image.
[signals,PC,V]=pca1(L);
PC1=PC(:,1);
bb=[1,zeros(1,82)]';
angle=acos(dot(PC1,bb)/norm(PC1)*norm(bb));
angle=180*angle/pi;
Lrotated=imrotate(L,angle);
% imshow(Lrotated)
%Calculating PCA with nonzero indices of L as input
Lind=[r(:) c(:)];
[signalsind,PCind,Vind]=pca1(Lind);
PC1ind=PCind(:,1);
bb2=[1,zeros(1,3237)]';
angle2=acos(dot(PC1ind,bb2)/norm(PC1ind)*norm(bb2));
angle2=180*angle2/pi;
Lrotated2=imrotate(L,angle2);
% imshow(Lrotated2)
figure;
subplot(1,2,1)
imshow(Lrotated)
ss1=sprintf('method 1 image rotated by %g degrees',angle);
title(ss1);
subplot(1,2,2)
imshow(Lrotated2)
ss2=sprintf('method 2 image rotated by %g degrees',angle2);
title(ss2);
