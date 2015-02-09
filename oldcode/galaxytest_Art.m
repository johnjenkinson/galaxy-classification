% testing moment for cropped image
%
% modified by Art Grigoryan

clear all; close all; clc
A=imread('AC8409_NGC4274.jpg');
[N M L]=size(A);

    X=double(A(:,:,1));

    figure;
    colormap(gray(255));       
    subplot(1,1,1);
    image(X); 
    axis image; axis off;

    
    pause(1)
    
xbar=0; ybar=0;
xn=0; yn=0;
for n=1:N
    for m=1:M
        a=X(n,m);
        xbar = xbar + n*a;
        ybar = ybar + m*a;
    end
end
ss=sum(sum(X));
xc=round(xbar/ss);   yc=round(ybar/ss);


% plot the center
subplot(1,1,1);
hold on;
h_1=text(yc,xc,'*');
set(h_1,'FontSize',16,'FontName','Times','Color',[1 0 0]);   
title('image and its center');
