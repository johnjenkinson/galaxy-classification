% call: galaxy_preprocessing.m
%
% greyscale galaxy preprocessing

clear all; close all; %clc;
s_dir=pwd;
cd bankjpg
A=imread('AC8483_UGC10288.jpg');
A=A(:,:,1);
cd(s_dir)

%% Gray-level Thresholding
[N M]=size(A);
% A=255-A; %negative of A (galaxy pixels are bright)
Z=ones(size(A));
for n=1:N
    for m=1:M
        if(A(n,m)<81)
            Z(n,m)=0;
        end
    end
end
Z=1-Z;
Z=uint8(Z);
Z=Z.*A;
I=imcrop(Z);


%% Rotating galaxy by angle computed from 2nd moments
I=double(I);
[m11,m20,m02]=secondmoment(I);
theta=(1/2)*atan2(2*m11,m20-m02);     % =  0.8973
theta_degrees=180*(theta/pi);         % = 51.4115
R=imrotate(I,90-theta_degrees);

%% Scale image to 128x128
S=imresize(R, [128 128]);
S=uint8(S);
imshow(S)
 
cd banksmall
imwrite(S,'AC8483_UGC10288_small.tif')
cd ..
