function [A, t] = estimateAffine(source_points, target_points)
%estimates an affine transformation mapping source_points to target_points
% generate matrix M, at least 3 source points are needed to solve equations
% with 6 unknowns
M = [source_points(:,1)' 1 0 0 0;0 0 0 source_points(:,1)' 1;...
    source_points(:,2)' 1 0 0 0;0 0 0 source_points(:,2)' 1;...
    source_points(:,3)' 1 0 0 0;0 0 0 source_points(:,3)' 1];
b = reshape(target_points,6,1);
theta = M\b;
A = [theta(1) theta(2);theta(4) theta(5)];
t = [theta(3);theta(6)];
end

