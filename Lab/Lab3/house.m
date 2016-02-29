clc;clear
load('house.mat');
% read image from gray scale
house1 = readAsGrayScale('house1.jpg');
house2 = readAsGrayScale('house2.jpg');
% extract SIFT points
[points1,f1] = extractSIFT(house1);
[points2,f2] = extractSIFT(house2);
% match SIFT points
indexPairs = matchFeatures(f1,f2,'Method',...
    'Approximate','MaxRatio',0.9,'MatchThreshold',100);
% get matched points
house1Matched = points1(:,indexPairs(:, 1));
house2Matched = points2(:,indexPairs(:, 2));
% store color infomation
house1 = im2double(imread('house1.jpg'));
colorInfo = zeros(length(house1Matched),3);
X = zeros(3,length(house1Matched));
X_new = zeros(3,1);
colorInfo_new = zeros(1,3);
k = 1;
% implement minimal trangulation
for i = 1:length(house1Matched)
    position = round(house1Matched(:,i));
    colorInfo(i,:) = house1(position(1),position(2),:);
    xs = [house1Matched(:,i) house2Matched(:,i)];
    X(:,i) = minimalTriangulation(Ps, xs);
    errors = reprojectionErrors(Ps, xs, X(:,i));
    nbr_outliers = length(find(errors > 10));
    if nbr_outliers == 0
        X_new(:,k) = X(:,i);
        colorInfo_new(k,:) = colorInfo(i,:);
        k = k+1;
    end
end

[X_new,removed_indices] = cleanForPlot(X_new);
colorInfo_new(removed_indices,:) = [];
scatter3(X_new(2,:),X_new(3,:),X_new(1,:),2,colorInfo_new);