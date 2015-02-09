% call: galaxy_ellipse_fit.m
%
% fit an ellipse to the convex hull of a galaxy

clear all; close all; clc;
s_dir=pwd;
cd banksmall
A=imread('AC8409_NGC4274_small.tif');
cd(s_dir)
[N M]=size(A);

gCanny=edge(A,'Canny',[0.5 0.8],5);

s=regionprops(gCanny,'BoundingBox');

[a b centroid bounding_box]=majminaxes(gCanny)

p=calculateEllipse(centroid(1), centroid(2), a/2, b/2,0);

figure;
subplot(2,2,1); imshow(A); title('original image')
subplot(2,2,2); imshow(gCanny); 
title('Canny edge')
subplot(2,2,3); imshow(gCanny); 
title('original image with fit');
hold on;
plot(p(:,1), p(:,2), '.-'); axis equal;
subplot(2,2,4); imshow(gCanny); 
title('Canny edge with fit');
hold on;
plot(p(:,1), p(:,2), '.-'); axis equal;
plot(centroid(1), centroid(2),'r*');
