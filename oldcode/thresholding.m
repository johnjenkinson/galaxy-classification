% call:findthresh.m
%
% Find the best threshold for the galaxy image

    clear all; close all; clc;
    I=imread('AC3085_NGC4242.tif');
    I=I(:,:,1);
    H=imhist(I);
    figure;
    subplot(2,2,1)
    imshow(I)
    subplot(2,2,[3,4])
    plot(H)
    T=68;
for i=110:170
    subplot(2,2,[3,4])
    hold on;
    T=i;
    xx=[T T];
    yy=[0 H(T)];
    hline=line(xx,yy);
    set(hline,'Color',[1 0 0]);
    htext=text(T-5, H(T),'T');
    set(htext,'Color',[1 0 0]);

    Ib=(I>T);
    subplot(2,2,2)
    imshow(Ib)
    ss=sprintf('Thresholding by %g',T);
    stitle=title(ss);

    pause(.5)
    delete(htext); delete(hline);
end
X=I>168;
imshow(X); hold on;
% Ix=ones(size(I));
% XMIN=155;
% XMAX=155+114;
% YMIN=96;
% YMAX=96+85;
% for i=XMIN:XMAX
%     for j=YMIN:YMAX
%         Ix(i,j)=I(i,j);
%     end
% end
% imshow(Ix)
[158 98 105 79]
plot(158,98,'r*')
plot(158+105,98+79,'r*')


