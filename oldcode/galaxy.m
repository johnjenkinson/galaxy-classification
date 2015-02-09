% call: galaxy.m
%
% preprocessing and feature extraction
clear all; close all; clc
s_dir=pwd;
cd bankjpg
X=imread('AC8409_NGC4274.jpg');
cd(s_dir)
X=X(:,:,1);
[N M]=size(X);
Xb=X>69; %threshold background subtraction
Xb=uint8(Xb);
Xb=1-Xb; %negative image
Xb=X.*Xb; 
xbar=0;
ybar=0;
for n=1:N %calculate center of brightness (centroid)
    for m=1:M
        xbar=xbar+n*Xb(n,m);
        ybar=ybar+m*Xb(n,m);
    end
end
ss=sum(sum(Xb));
xbar=xbar/ss;
ybar=ybar/ss;
for n=1:N %central moments
    for m=1:M
        mu20=(n-xbar)^2*Xb(n,m);
        mu02=(m-ybar)^2*Xb(n,m);
        mu11=(n-xbar)*(m-ybar)*Xb(n,m);
    end
end


