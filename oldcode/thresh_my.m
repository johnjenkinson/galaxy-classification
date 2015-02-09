clear all; close all; clc
s_dir = pwd;
cd banksmall
f = imread('Sa.jpg');
% mx = max(f(:));
% f = mx - f;
cd(s_dir)
H = fspecial('gaussian');
o = imfilter(f,H);
figure;
imshow(f)
figure;
subplot(2,2,1)
imshow(o,[])
subplot(2,2,2)
imshow(o)
h = imhist(o);
h = h/max(h);
subplot(2,2,[3,4]); hold on;
plot(h)
j = 120;
o = o>= j;
xx = [j j];
yy = [0 h(j)];
h_line = line(xx, yy);
set(h_line, 'color', 'r');
for j = 1:numel(numel(o))
    
    subplot(2,2,2)
    imshow(o)
    h = imhist(o);
    h = h/max(h);
    subplot(2,2,[3,4])
    plot(h)
   
    pause(.5)
end

figure;
imshow(o)
