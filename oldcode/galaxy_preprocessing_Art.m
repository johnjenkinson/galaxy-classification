% call: galaxy_preprocessingA.m
%
% galaxy image preprocessing

clear all; close all; clc;
A=imread('S0T68small.tif');

%% Rotating galaxy by angle computed from 2nd moments
A=double(A);
[m11,m20,m02]=secondmoment(A);
theta=(1/2)*atan2(2*m11,m20-m02);     % =  0.8973
theta_degrees=180*(theta/pi);         % = 51.4115
Arotated=imrotate(A,90-theta_degrees);

%% display the images
figure;
subplot(1,2,1)
imshow(A)
title('original image')
%
subplot(1,2,2)
imshow(Arotated)
title('image rotated by 2nd moments')
