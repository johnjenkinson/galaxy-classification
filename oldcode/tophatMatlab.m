% tophat transform of galaxies for segmentation
%
% john jenkinson, UTSA 2014
clear all; close all; clc;
s_dir = pwd;
cd bankjpg;
f = imread('AC8409_NGC4274.jpg');
cd(s_dir)
f = f(:, :, 1);
mx = max(f(:));
f0 = mx-f;
%% structuring element 11-by-11 square
se1 = strel('square',11);      % 11-by-11 square
%         se2 = strel('line',10,45)     % line, length 10, angle 45 degrees
%         se3 = strel('disk',15)        % disk, radius 15
%         se4 = strel('ball',15,5)      % ball, radius 15, height 5
% 
ff = imtophat(f, se1);
ffe = imadjust(ff);
ff0 = imtophat(f0, se1);
ff0e = imadjust(ff0);
figure;
subplot(3,2,1);
imshow(f); title('original image')
subplot(3,2,3)
imshow(ff, []); title('tophat transformed image')
subplot(3,2,2)
imshow(f0, []); title('negative image')
subplot(3,2,4)
imshow(ff0, []); title('negative tophat')
subplot(3,2,5)
imshow(ffe, []); title('tophat enhanced')
subplot(3,2,6)
imshow(ff0e, []); title('negative tophat enhanced')
% cd bankjpgtophat\
% imwrite(f0, 'negative_image.jpg');
% imwrite(ff, 'tophat_transformed.jpg');
% imwrite(ff0, 'negative_tophat.jpg');
% imwrite(ffe, 'tophat_enhanced.jpg');
% imwrite(ff0e, 'negative_tophat_enhanced.jpg');
% cd(s_dir)
%% structuring element line, length 10, angle 45 degrees
clear all; clc
s_dir = pwd;
cd bankjpg;
f = imread('AC8409_NGC4274.jpg');
cd(s_dir)
f = f(:, :, 1);
mx = max(f(:));
f0 = mx-f;
se2 = strel('line',10,45)     % line, length 10, angle 45 degrees
ff = imtophat(f, se2);
ffe = imadjust(ff);
ff0 = imtophat(f0, se2);
ff0e = imadjust(ff0);
figure;
subplot(3,2,1);
imshow(f); title('original image')
subplot(3,2,3)
imshow(ff, []); title('tophat transformed image')
subplot(3,2,2)
imshow(f0, []); title('negative image')
subplot(3,2,4)
imshow(ff0, []); title('negative tophat')
subplot(3,2,5)
imshow(ffe, []); title('tophat enhanced')
subplot(3,2,6)
imshow(ff0e, []); title('negative tophat enhanced')
% cd bankjpgtophat\
% imwrite(f0, 'negative_image.jpg');
% imwrite(ff, 'tophat_transformed.jpg');
% imwrite(ff0, 'negative_tophat.jpg');
% imwrite(ffe, 'tophat_enhanced.jpg');
% imwrite(ff0e, 'negative_tophat_enhanced.jpg');
% cd(s_dir)
%% structuring element disk, radius 15
clear all; clc
s_dir = pwd;
cd bankjpg;
f = imread('AC8409_NGC4274.jpg');
cd(s_dir)
f = f(:, :, 1);
mx = max(f(:));
f0 = mx-f;
se3 = strel('disk',15);        % disk, radius 15
ff = imtophat(f, se3);
ffe = imadjust(ff);
ff0 = imtophat(f0, se3);
ff0e = imadjust(ff0);
figure;
subplot(3,2,1);
imshow(f); title('original image')
subplot(3,2,3)
imshow(ff, []); title('tophat transformed image')
subplot(3,2,2)
imshow(f0, []); title('negative image')
subplot(3,2,4)
imshow(ff0, []); title('negative tophat')
subplot(3,2,5)
imshow(ffe, []); title('tophat enhanced')
subplot(3,2,6)
imshow(ff0e, []); title('negative tophat enhanced')
% cd bankjpgtophat\
% imwrite(f0, 'negative_image.jpg');
% imwrite(ff, 'tophat_transformed.jpg');
% imwrite(ff0, 'negative_tophat.jpg');
% imwrite(ffe, 'tophat_enhanced.jpg');
% imwrite(ff0e, 'negative_tophat_enhanced.jpg');
% cd(s_dir)
%% structuring element ball, radius 15, height 5
clear all; clc
s_dir = pwd;
cd bankjpg;
f = imread('AC8409_NGC4274.jpg');
cd(s_dir)
f = f(:, :, 1);
mx = max(f(:));
f0 = mx-f;
se4 = strel('ball',15,5);      % ball, radius 15, height 5
ff = imtophat(f, se4);
ffe = imadjust(ff);
ff0 = imtophat(f0, se4);
ff0e = imadjust(ff0);
figure;
subplot(3,2,1);
imshow(f); title('original image')
subplot(3,2,3)
imshow(ff, []); title('tophat transformed image')
subplot(3,2,2)
imshow(f0, []); title('negative image')
subplot(3,2,4)
imshow(ff0, []); title('negative tophat')
subplot(3,2,5)
imshow(ffe, []); title('tophat enhanced')
subplot(3,2,6)
imshow(ff0e, []); title('negative tophat enhanced')
% cd bankjpgtophat\
% imwrite(f0, 'negative_image.jpg');
% imwrite(ff, 'tophat_transformed.jpg');
% imwrite(ff0, 'negative_tophat.jpg');
% imwrite(ffe, 'tophat_enhanced.jpg');
% imwrite(ff0e, 'negative_tophat_enhanced.jpg');
% cd(s_dir)


