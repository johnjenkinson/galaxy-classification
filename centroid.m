% call: centroid.m
%
% calculate the first moment of an image. centroid(X,I) calculates 
% the centroid for binary or grayscale image X.  If X is binary, I=0.  
% If X is intensity image, I=1.
% John Jenkinson, Dr. Artyom Grigoryan, ECE UTSA 2014.
function[xc,yc]=centroid(X,I)
    [N M L]=size(X);
    X=double(X(:,:,1));
    xbar=0; ybar=0;
    for n=1:N
        for m=1:M
            a=X(n,m);
            xbar = xbar + n*a;
            ybar = ybar + m*a;
        end
    end
if(I==1)
    ss=sum(X(:)); %faster than sum(sum(X)) for type double
else if(I==0)
        ss=N*M;
    end
end 
xc=round(xbar/ss); yc=round(ybar/ss);
end
