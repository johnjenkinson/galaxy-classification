% call: findangle.m
%
% Calcuate covariance matrix C from image X and centroid
% (xc,yc).  Apply PCA to C to obtain angle alpha between 
% first p.c. and x-axis.
function[alpha]=findangle(X,xc,yc)

    C=zeros(2);
    [N M L]=size(X);
    
    for n=1:N
        for m=1:M
            cm=[n-xc,m-yc]'*[n-xc,m-yc];
            Xcm=X(n,m)*cm;
            C=C+Xcm;
        end
    end
    
    [PC, V] = eig(C); % C in basis PC: C=PC*V*PC') 
    V = diag(V);
    [junk, rindices] = sort(V,'descend');
    PC = PC(:,rindices); 

    theta=atan(PC(2,1)/PC(1,1)); % calculate alpha
    alpha=180*theta/pi;   
end
