function [a,b,c] = ransacFitLine(points, threshold)
%implements Ransac for line fitting
n = 10000; % iteration time
loss = zeros(1,n);
A = zeros(1,n);
B = zeros(1,n);
C = zeros(1,n);
for i = 1:n
P = randperm(length(points),2);
[A(i), B(i), C(i)] = estimateLine(points(:,P(1)), points(:,P(2)));
distances = distanceToLine(points, A(i), B(i), C(i));
loss(i) = countOutliers(distances, threshold);
end
[~,I] = min(loss);
a = A(I);
b = B(I);
c = C(I);
end

