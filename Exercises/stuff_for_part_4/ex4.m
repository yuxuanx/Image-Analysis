%% Ex 4.1
load('line_data');
[a,b,c] = ransacFitLine(edge_points, 100);
plotLineAndPoints(img, a, b, c, edge_points);
%% Ex 4.5
% number of iterations = 100/(1-0.9)^100
%% Ex 4.6
% randomly choose three points to form a circle *****
load('eye_data');
% [rowcoords, colcoords] = find(edge(gaussianFilter(img, 3)));
points = edge_points;
n = 10000; % iteration time
loss = zeros(1,n);
Centre = zeros(2,n);
Radius = zeros(1,n);
C = zeros(1,n);
for i = 1:n
    P = randperm(length(points),2);
    Centre(:,i) = (points(:,P(1)) + points(:,P(2)))/2;
    Radius(i) = norm(points(:,P(1)) - points(:,P(2)))/2;
    distances = sqrt((points(1,:) - Centre(1)).^2 + (points(2,:) - Centre(2)).^2);
    loss(i) = length(find(abs(distances - Radius(i)) > 10));
end
[~,I] = min(loss);
centre = Centre(:,I);
radius = Radius(I);
plotCircleAndPoints(img,centre,radius,points)
%% Ex 4.7
