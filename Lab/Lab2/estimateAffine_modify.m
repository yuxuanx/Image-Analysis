function [A, t] = estimateAffine_modify(source_points, target_points)
%estimates an affine transformation mapping source_points to target_points
% generate matrix M, at least 3 source points are needed to solve equations
% with 6 unknowns
n = length(source_points);
M = zeros(2*n,6);
for i=1:n;
    M(2*i-1:2*i,:) = [source_points(:,i)' 1 0 0 0;0 0 0 source_points(:,i)' 1];
end
% M = [source_points(:,1)' 1 0 0 0;0 0 0 source_points(:,1)' 1;...
%     source_points(:,2)' 1 0 0 0;0 0 0 source_points(:,2)' 1;...
%     source_points(:,3)' 1 0 0 0;0 0 0 source_points(:,3)' 1];
b = reshape(target_points,2*n,1);
theta = M\b;
A = [theta(1) theta(2);theta(4) theta(5)];
t = [theta(3);theta(6)];
end

