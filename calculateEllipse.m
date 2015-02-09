% call: calculateEllipse.m
%
% calculate points to draw an ellipse
function [X,Y] = calculateEllipse(x, y, a, b, angle, steps)
    %  x coordinate
    %  y coordinate
    %  semimajor axis
    %  semiminor axis
    %  angle of the ellipse (in degrees)
    narginchk(5, 6);
    if nargin<6, steps = 36; end
    beta = -angle * (pi / 180);
    sinbeta = sin(beta);
    cosbeta = cos(beta);
    alpha = linspace(0, 360, steps)' .* (pi / 180);
    sinalpha = sin(alpha);
    cosalpha = cos(alpha);
    X = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
    Y = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);
    if nargout==1, X = [X Y]; end
end
