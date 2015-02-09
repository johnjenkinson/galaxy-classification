% testing moment for cropped image
clear all; close all; clc
A=imread('AC8409_NGC4274.tif');
[N M]=size(A);
xbar=0;
ybar=0;
for n=1:N
    for m=1:M
        xbar=xbar+n*A(n,m);
        ybar=ybar+m*A(n,m);
    end
end
ss=sum(sum(A));
xbar=xbar/ss;
ybar=ybar/ss;
