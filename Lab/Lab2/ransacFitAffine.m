function [A,t] = ransacFitAffine(source_points, target_points, threshold)
%Ransac to find an affine transformation between two sets of points
N = 500; % number of samples
outlier_rate = 0.5;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
% initialization
rate = zeros(iter_num,1);
A_hat = zeros(2,2,iter_num);
t_hat = zeros(2,1,iter_num);
for i = 1:iter_num
    index1 = randi(N);
    index2 = randi(N);
    index3 = randi(N);
    source_point = [source_points(:,index1) source_points(:,index2) source_points(:,index3)];
    target_point = [target_points(:,index1) target_points(:,index2) source_points(:,index3)];
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat(:,:,i), t_hat(:,:,i)] = estimateAffine(source_point, target_point);
    absResiduals = absoluteResiduals(A_hat(:,:,i), t_hat(:,:,i), source_points, target_points);
    rate(i) = length(find(absResiduals > threshold))/N;
end
% find the one most close to the right number of outliers
[~,I] = min(abs(rate - outlier_rate));
A = A_hat(:,:,I);
t = t_hat(:,:,I);
rate(I)
end

