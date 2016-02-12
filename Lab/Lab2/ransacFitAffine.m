function [A,t] = ransacFitAffine(source_points, target_points, threshold)
%Ransac to find an affine transformation between two sets of points
N = length(source_points); % number of samples
outlier_rate = 0.7;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
bestOutNum = N;
for i = 1:iter_num
    index = randperm(N,80);
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat, t_hat] = estimateAffine_modify(source_points(:, index), target_points(:, index));
    % calculate absolute residuals
    absResiduals = absoluteResiduals(A_hat, t_hat, source_points, target_points);
    % find number of outliers
    outlierNum = length(find(absResiduals>threshold));
    % evaluate current model decided whether to update
    if outlierNum<bestOutNum && isempty(find(isnan(A_hat)==1, 1))
        bestOutNum = outlierNum;
        A = A_hat;
        t = t_hat;
    end
end
end

