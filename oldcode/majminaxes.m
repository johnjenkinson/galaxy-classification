% call: majminaxes.m
%
% calculate the major and minor axis by centroid
% John Jenkinson, UTSA, June 2014
function[a b centroid bounding_box]=majminaxes(gCanny)
s=regionprops(gCanny,'Centroid','MajorAxisLength',...
    'MinorAxisLength','Eccentricity','BoundingBox');
[N M]=size(gCanny);
xbar=gCanny(round(s.Centroid(1)),:);
ybar=gCanny(:,round(s.Centroid(2)));
%major axis endpoint calculations.
majaxisendpts=[];
for y=1:N
    if(xbar(y)==1)
        majaxisendpts=[majaxisendpts y];
        %sprintf('%g',y) to display endpoints in cmd window.
    end
end
%minor axis endpoint calculations.
minaxisendpts=[];
for x=1:M
    if(ybar(x)==1)
        minaxisendpts=[minaxisendpts x];
        %sprintf('%g',x)
    end
end
a=majaxisendpts(2)-majaxisendpts(1);
b=minaxisendpts(2)-minaxisendpts(1);
centroid=[s.Centroid(1) s.Centroid(2)];
%bounding rectangle position vector
L1=majaxisendpts(1);
W1=minaxisendpts(1);
bounding_box=[L1 W1 a b];%used to superimpose rectangle on galaxy plot
