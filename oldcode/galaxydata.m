% Starting from the row image of the gallaxy (here SOT68small.tif), we prepare data for operating PCA on.
% Data is going to be processed as indicated in calleja.pdf page 3/7, formulas
% (1),(2), (3), (4)
bw=imread('S0T68small.tif'); %bw is a binary matrix as coming from the tif file here (a negative image of a galaxy?)
B=ones(size(bw))-double(bw); %casting bw into a matrix of entries of type double (here 0 and 1, 1 for bright spots). This counts for formula (1)
[m,n] = size(B);
ibar=0; jbar=0;
for i=1:m
    ibar=sum(i*B(i,:))+ibar;
end
ibar=ibar/(m*n);
for j=1:n
    jbar=sum(j*B(:,j))+jbar;
end
jbar=jbar/(m*n);
%This counts for formuals (2) and (3)
C=zeros(2);%initialization of the covariance matrix
for i=1:m
    for j=1:n
        C=C+B(i,j)*[i-ibar,j-jbar]'*[i-ibar, j-jbar];
    end
end
% C is the covariance matrix. This counts for formula (4)
 [PC, V] = eig(C); %PC=eigenvectors' matrix (it is orthogonal); V=diagonal matrix of C (or C in basis PC: C=PC*V*PC') 
V = diag(V);
% sort the variances in decreasing order
[junk, rindices] = sort(V,'descend');
V = V(rindices);
PC = PC(:,rindices); %PC becomes the matrix whose columns from left to right are the principal components of data
% Aligning data with the principal components comes to writing the data in
% base PC (equivalent to applying a rotation of angle the angle between
% x-axis and PC(:,1) to each [i-ibar;j-jbar] where B(i,j)=1; 
t=atan(PC(2,1)/PC(1,1));
t=180*t/pi;
G=imrotate(B,t,'crop'); %rotates B by the angle t (in degrees)
figure,
imshow(B); %initial image
figure,
imshow(G); %rotated image

