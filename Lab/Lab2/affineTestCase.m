function [source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase(outlier_rate)
%generates a test case for estimating an affine transformation.
N = 500; % number of source points
source_pts = [randi(N,1,N);randi(N,1,N)]; % generate source points randomly
% generate A_true uniformly random in [-2,2]
A_true = [-2+4*rand -2+4*rand;-2+4*rand -2+4*rand];
% generate t_true uniformly random in [-100,100]
t_true = [-100+randi(200);-100+randi(200)];
% replicate to make it the same size as source_pts
target_pts = A_true*source_pts + repmat(t_true,1,500);
% percentage of outliers to the output points
outlier_percent = (1-outlier_rate)^3;
end

