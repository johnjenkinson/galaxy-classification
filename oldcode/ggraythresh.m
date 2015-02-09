% call: ggraythresh.m
%
% grayscale thresholding
% calculate grayscale image by image A and threshold T
function[X]=ggraythresh(A,T)

    [N M L]=size(A);
    A=double(A(:,:,1));
    
    X=A>T;
    X=1-X;
    X=X.*A;
end
