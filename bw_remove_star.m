% call: bw_remove_star.m
% filtering stars from binary galaxy image
% John Jenkinson, UTSA 2014
clear all; close all; clc;
s_dir=pwd;
cd banksmall
f=imread('S0T68.jpg');
cd(s_dir)
f=f(:,:,1);
bw=im2bw(f);
h_fig=figure;
subplot(2,2,1)
h=imshow(bw);
stitle1=title('Original image');
% for i=50:5000
% P=i;
P=128; %remove objects with fewers than P pixels
fnew1=bwareaopen(bw, P);
subplot(2,2,2)
imshow(fnew1)
ss2=sprintf('stars removed by fewer than %g pixels',P);
stitle2=title(ss2);
% pause(.05)
% end
P2=256;
fnew2=bwareaopen(bw, P2);
subplot(2,2,3)
imshow(fnew2)
ss3=sprintf('stars removed by fewer than %g pixels',P2);
stitle3=title(ss3);
%
P3=512;
fnew3=bwareaopen(bw, P3);
subplot(2,2,4)
imshow(fnew3)
ss4=sprintf('stars removed by fewer than %g pixels',P3);
stitle4=title(ss4);
