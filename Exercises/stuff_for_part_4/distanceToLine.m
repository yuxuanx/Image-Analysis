function [ distances ] = distanceToLine(points, a, b, c)
%computes the orthogonal distances between the 2*N - array points and the 
%line defined by a, b and c.
distances = ([a, b]*points + c)/sqrt(a^2+b^2);

end

