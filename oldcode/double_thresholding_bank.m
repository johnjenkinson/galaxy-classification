% doublethreshold galaxy images
%
% john jenkinson, UTSA 2014
s_dir = pwd;
cd bankjpg
f = imread('AC8409_NGC4448.jpg');
cd(s_dir)
f = f(:,:,1);
imagesc(f); colormap(gray)
%ft = f >=67 & f <=100;
thresh = multithresh(f, 2) %Otsu's method
ft = f >= thresh(1) & f <= thresh(2);
imagesc(ft); colormap(gray)
se1 = strel('square',11);
fto = bwareaopen(ft,512);
imagesc(fto)
fto = 1-fto;
imagesc(fto)
