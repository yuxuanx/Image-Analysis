function [Xest, loss, nbr_inliers] = triangulatePoint_modify(xs, Ps, threshold)
%first uses Ransac, then removes outliers and performs five Gauss-Newton 
%steps on the inliers to refine the Ransac solution.
iter_num = 1e2; % number of interations
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
P = Ps(1,errors <= threshold); % remove outliers
x = xs(:,errors <= threshold);
for j = 1:5
    J = computeJacobian(X, P);
    residuals = computeResiduals(P, x, X);
    loss = sum(residuals.^2);
    X = X - inv(J'*J)*J'*residuals; % update X using Gauss-newton iteration
    ers = reprojectionErrors(P, x, X);
    P = P(1,ers <= threshold); % remove outliers
    x = x(:,ers <= threshold);
    if length(find(ers > threshold)) < 2
        break
    end
end
Xest = X;
end

