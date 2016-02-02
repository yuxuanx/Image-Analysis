function [a, b, c] = estimateLine(point1, point2)
%takes two points as input and estimates the coordinates of a line through
%these two points.
c = 1;
b = (point1(1)-point2(1))/(point1(2)*point2(1)-point2(2)*point1(1));
a = (point1(2)-point2(2))/(point1(1)*point2(2)-point1(2)*point2(1));

end

