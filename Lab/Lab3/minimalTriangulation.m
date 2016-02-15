function X = minimalTriangulation(Ps, xs)
%makes a minimal solver for the triangulation problem
% form matrix equation M * theta = b from camera equations
b = [Ps{1}(:,4);Ps{2}(:,4)];
M = [-[Ps{1}(:,1:3);Ps{2}(:,1:3)] [xs(:,1)' 1 0 0 0]' [0 0 0 xs(:,2)' 1]'];
% least squares solver
theta = M\b;
X = theta(1:3);
end

