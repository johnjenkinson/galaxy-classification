% call: galaxy2.m
%
% preprocessing and feature extraction
% John Jenkinson

    clear all; close all; clc
    s_dir=pwd;
    A=imread('AC3085_NGC4242.tif');
    [N M L]=size(A);
    A=double(A(:,:,1));
    
% grayscale thresholding
    X=ggraythresh(A,69); 
    
% center of brightness
    [xc,yc]=centroid(X,1);
  
% rotate galaxy by second moment m11 angle
    [m11,m20,m02]=secondmoment(X);    
    theta=(1/2)*atan2(2*m11,m20-m02);  
    alpha=theta*(180/pi);              
    Xr=imrotate(X,alpha+90);   

% resize the galaxy to uniform 128x128
    Xs=imresize(Xr,[128 128]);



 
    
