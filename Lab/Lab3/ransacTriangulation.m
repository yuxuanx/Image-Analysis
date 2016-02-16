function [X, nbr_inliers] = ransacTriangulation(Ps, xs, threshold)
%implements triangulation using Ransac
% Use the number of outliers as loss function. A measurement is deemed as 
% an outlier if the depth is negative or if the reprojection error is 
% larger than threshold.
iter_num = 1e4; % number of interations
bestOutliers = Inf; % loss function
for i = 1:iter_num
    index = randperm(length(Ps),2); % each time pick 2 camera equations and 2 image points
    % using minimal solver to get estimated X
    X_hat = minimalTriangulation(Ps(1,index), xs(:,index));
    % calculate residual errors
    errors = reprojectionErrors(Ps, xs, X_hat);
    % find outliers based on threshold
    nbr_outliers = length(find(errors > threshold));
    % evaluate loss function, if estimation has less outliers
    if nbr_outliers < bestOutliers
        bestOutliers = nbr_outliers;
        X = X_hat;
        nbr_inliers = length(Ps) - nbr_outliers;
    end
end
end

