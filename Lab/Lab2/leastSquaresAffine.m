function [A, t] = leastSquaresAffine(source_points, target_points)
%using least mean square on Ransac affine
N = length(source_points); % number of samples
outlier_rate = 0.8;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
lmsBest = 1e9;
for i = 1:iter_num
    index = randperm(N,100);
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat, t_hat] = estimateAffine_modify(source_points(:, index), target_points(:, index));
    % calculate absolute residuals
    absResiduals = absoluteResiduals(A_hat, t_hat, source_points, target_points);
    % find outliers with least mean square
    lms = sum(absResiduals(absResiduals > 1000).^2);
    if lms < lmsBest
        A = A_hat;
        t = t_hat;
        lmsBest = lms;
    end
end

end

