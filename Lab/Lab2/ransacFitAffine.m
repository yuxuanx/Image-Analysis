function [A,t] = ransacFitAffine(source_points, target_points, threshold)
%Ransac to find an affine transformation between two sets of points
N = length(source_points); % number of samples
outlier_rate = 0.8;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
bestOutNum = N;
for i = 1:iter_num
    index = randperm(N);
    source_point = [source_points(:,index(1)) source_points(:,index(2)) source_points(:,index(3))];
    target_point = [target_points(:,index(1)) target_points(:,index(2)) source_points(:,index(3))];
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat, t_hat] = estimateAffine(source_point, target_point);
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

