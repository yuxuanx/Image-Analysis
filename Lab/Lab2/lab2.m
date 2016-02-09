%% Ex 2.1
% K = 3
%% Ex 2.2
img = readAsGrayScale('images/mona.png');
A = [0.88 -0.48; 0.48 0.88];
t = [100;-100];
target_size = [440 508];
warped = affineWarp(target_size, img, A, t); imagesc(warped);
axis image;
colormap gray
%% Ex 2.4
clc;clear
[source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase(0.5);
index1 = randi(500);
index2 = randi(500);
index3 = randi(500);
source_points = [source_pts(:,index1) source_pts(:,index2) source_pts(:,index3)];
target_points = [target_pts(:,index1) target_pts(:,index2) source_pts(:,index3)];
[A, t] = estimateAffine(source_points, target_points);
%% Ex 2.5
absResiduals = absoluteResiduals(A, t, source_pts, target_pts);
%% Ex 2.7
clc;clear
[source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase(0.5);
[A,t] = ransacFitAffine(source_pts, target_pts, 100);


