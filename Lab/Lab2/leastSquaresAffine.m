function [A, t] = leastSquaresAffine(source_points, target_points)
%uses least squares on the inliers from Ransac to refine the estimate.
N = length(source_points); % number of samples
outlier_rate = 0.7;
outlier_percent = (1-outlier_rate)^3;
iter_num = int32(100/outlier_percent); % number of iteration used in Ransec
loss = Inf;
threshold = 1;
for i = 1:iter_num
    index = randperm(N,3);
    % for each iteration, randomly choose three points to estimate
    % transformation
    [A_hat, t_hat] = estimateAffine(source_points(:, index), target_points(:, index));
    % calculate absolute residuals
    absResiduals = absoluteResiduals(A_hat, t_hat, source_points, target_points);
    % find least squares
    in_liners = find(absResiduals <= threshold);
    out_liners = N - length(in_liners);
    if (out_liners < loss)&&(out_liners ~= 0)
        inliers = in_liners;
        loss = out_liners;
    end
end
source_inliers=source_points(:,inliers);
target_inliers=target_points(:,inliers);
M=zeros(2*length(inliers),6);
b=zeros(2*length(inliers),1);
% use linear least squares on the inliers
for n=1:length(inliers)
    M(2*n-1,:)=[source_inliers(1,n) source_inliers(2,n) 1 0 0 0];
    M(2*n,:)=[0 0 0 source_inliers(1,n) source_inliers(2,n) 1];
    b(2*n-1)=target_inliers(1,n);
    b(2*n)=target_inliers(2,n);
end
theta=(M.'*M)\(M.'*b);
A=[theta(1) theta(2);
   theta(4) theta(5)];
t=[theta(3);theta(6)];
end


