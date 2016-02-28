function [A, t] = leastSquaresAffine(source_points, target_points)
%uses least squares on the inliers from Ransac to refine the estimate.
N = length(source_points); % number of samples
outlier_rate = 0.7;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
leastSquares = Inf;
threshold = 2;
for i = 1:iter_num
    index = randperm(N,3);
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat, t_hat] = estimateAffine(source_points(:, index), target_points(:, index));
    % calculate absolute residuals
    absResiduals = absoluteResiduals(A_hat, t_hat, source_points, target_points);
    % find least squares
    ls = sum(min(absResiduals, ones(1, length(absResiduals))*threshold));
    % evaluate current model decided whether to update
    if ls < leastSquares && isempty(find(isnan(A_hat)==1, 1))
        leastSquares = ls;
        A = A_hat;
        t = t_hat;
    end
end

end

