% call: secondmoment.m
%
% Let say you have the image A(n,m) of galaxy of size NxM the moment mu(11) 
% is calculated as follows:
% by Art Grigoryan edited by John Jenkinson
function [m11,m20,m02]=secondmoment(A)
[N,M]=size(A);
m11=0;
m20=0;
m02=0;
for n=0:N-1
    n1=n+1;
     for m=0:M-1
           a=A(n1,m+1);
           ma=m*a; 
           na=n*a;
           m11=m11+n*ma;
           m20=m20+n*na;
           m02=m02+m*ma;
    end
end
    if(islogical(A)==1)
    % normalization
        ss=N*M;
        m11=m11/ss;
        m20=m20/ss;
        m02=m02/ss;         
    else
    % normalization
        ss=sum(sum(A));
        m11=round(m11/ss);
        m20=round(m20/ss);
        m02=round(m02/ss);
    end
end
