function absResiduals = absoluteResiduals(A, t, source_points, target_points)
%computes the lengths of the 2D residual vectors
% calculate the residuals
r = A * source_points + repmat(t,1,length(source_points)) - target_points;
% get the absolute residuals
absResiduals = sqrt(sum(r.^2, 1));
end

