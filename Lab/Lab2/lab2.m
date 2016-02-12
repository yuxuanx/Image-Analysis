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
index = randperm(500,3);
[A, t] = estimateAffine(source_pts(:, index), target_pts(:, index));
%% Ex 2.5
absResiduals = absoluteResiduals(A, t, source_pts, target_pts);
%% Ex 2.7
clc;clear
[source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase(0.01);
[A,t] = ransacFitAffine(source_pts, target_pts, 500);
%% Ex 2.9 
clc;clear
source = readAsGrayScale('images/vermeer_source.png');
target = readAsGrayScale('images/vermeer_target.png');
warped = alignImages(source, target);
switchPlot(warped,target);
%% Ex 2.10
clc;clear
source = readAsGrayScale('images/CT_1.jpg');
target = readAsGrayScale('images/CT_2.jpg');
warped = alignImages(source, target);
switchPlot(warped,target);
%% Ex 2.11
clc;clear
source = readAsGrayScale('images/tissue_brightfield.tif');
target = readAsGrayScale('images/tissue_fluorescent.tif');
target = 1 - target;
warped = alignImages(source, target);
switchPlot(warped,target);
%% Ex 2.13
clc;clear
source = readAsGrayScale('images/source16x16.tif');
warped = warp16x16(source);
imagesc(warped);
colormap gray