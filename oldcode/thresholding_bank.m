%thresholding data bank
clear all; close all; clc;
s_dir = pwd;
cd bankjpg
f = imread('AC8483_UGC10288.jpg');
%Name   Size       Bytes    Class
%f      303x398    120594   uint8   
cd(s_dir);
f = f(:,:,1);
f=double(f);
%display the galaxy
[N M]=size(f);
h_fig1=figure;
set(h_fig1,'Position',[0 388 523 300]);
subplot(2,2,1);
imagesc(f);
axis image; axis off; colormap(gray); 
h_title=title('Galaxy UGC10288'); 
set(h_title,'Color',[0 0 0],'FontName','Times','FontSize',11);
% Thresholding by the histogram of the image
T=81; k_show=2; S_color='b';
H=hist_my(f,2,1,k_show,S_color);
fb=zeros(N,M);   % binary image
    for n=1:N
        for m=1:M
            if f(n,m)>=T 
                fb(n,m)=1;  % 255 
            end
        end
    end
% clear fb;
% fb=(f>=T); vectorized
subplot(2,1,k_show); hold on;
x1=[T,T]; y1=[0,H(T)+0.002];
h_line=line(x1,y1);
set(h_line,'Color','r');
stext=sprintf('%g',T);
h_text=text(T-5,H(T)+0.003,stext);
set(h_text,'Color',[1 0 0]);
subplot(2,2,2);
imagesc(fb);
axis image; axis off;
ss=sprintf('Thresholding by %g',T)
h_title=title(ss);
set(h_title,'Color',[0 0 1],'FontName','Times','FontSize',11);
cd bankjpgT
imwrite(fb,'AC8483_UGC10288T81.jpg');
cd(s_dir);
% change the threshold          
pause(1);
delete(h_line); delete(h_text);
fb=zeros(N,M);
for T=60:110
    subplot(2,1,2)
    hold on;
    x1=[T,T]; y1=[0,H(T)+0.002];
    h_line=line(x1,y1);
    set(h_line,'Color','r');
    stext=sprintf('%g',T);
    h_text=text(T-5,H(T)+0.003,stext);
    set(h_text,'Color',[1 0 0]);
    
    fb=(f>=T);
    subplot(2,2,2);
    imagesc(fb);
    axis image; axis off;
    ss=sprintf('Thresholding by %g',T)
    h_title=title(ss);
    set(h_title,'Color',[0 0 1],...
        'FontName','Times','FontSize',11);
    
    pause(.5);
    delete(h_line); delete(h_text);
end
