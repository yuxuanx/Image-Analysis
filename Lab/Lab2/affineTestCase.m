function [source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase(outlier_rate)
%generates a test case for estimating an affine transformation.
N = 500; % number of source points
inlierNum = int32(N*(1-outlier_rate));
outlierNum = int32(N - inlierNum);
source_pts = [N*rand(1,N);N*rand(1,N)]; % generate source points randomly
% generate A_true uniformly random in [-2,4]
A_true = [-2+6*rand -2+6*rand;-2+6*rand -2+6*rand];
% generate t_true uniformly random in [-10,10]
t_true = [-10+20*rand;-10+20*rand];
% replicate to make it the same size as source_pts
target_pts = A_true*source_pts(:,1:inlierNum) + repmat(t_true,1,inlierNum);
target_pts = [target_pts,[N*rand(1,outlierNum);N*rand(1,outlierNum)]];
% percentage of outliers to the output points
outlier_percent = (1-outlier_rate)^3;
end

