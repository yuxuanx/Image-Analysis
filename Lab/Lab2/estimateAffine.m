function [A, t] = estimateAffine(source_points, target_points)
%estimates an affine transformation mapping source_points to target_points
% generate matrix M, at least 3 source points are needed to solve equations
% with 6 unknowns
M = [source_points(:,1)' 0 0 1 0;0 0 source_points(:,1)' 0 1;...
    source_points(:,2)' 0 0 1 0;0 0 source_points(:,2)' 0 1;...
    source_points(:,3)' 0 0 1 0;0 0 source_points(:,3)' 0 1];
b = reshape(target_points,6,1);
theta = M\b;
A = [theta(1) theta(2);theta(3) theta(4)];
t = [theta(5);theta(6)];
end

