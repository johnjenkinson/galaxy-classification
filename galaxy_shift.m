% call: galaxy_shift.m
%
% Shift the center of brightness to the image center.
% John Jenkinson, ECE UTSA 2014.
function[Y]=galaxy_shift(g,xc,yc)
[N M L]=size(g);
Y=zeros(N,M);
if(N/2-yc<0 & M/2-xc<0)
Y(1:N+(N/2-yc),1:M+(M/2-xc))=g(1-(N/2-yc):N,1-(M/2-xc):M);
else if(N/2-yc<0 & M/2-xc>0)
Y(1:N+(N/2-yc),1+(M/2-xc):M)=g(1-(N/2-yc):N,1:M-(M/2-xc));
else if(N/2-yc>0 & M/2-xc<0)
Y(1+(N/2-yc):N,1:M+(M/2-xc))=g(1:N-(N/2-yc),1-(M/2-xc):M);
else if(N/2-yc>0 & M/2-xc>0)
Y(1+(N/2-yc):N,1+(M/2-xc):M)=g(1:N-(N/2-yc),1:M-(M/2-xc));
    end
    end
    end
end
end
