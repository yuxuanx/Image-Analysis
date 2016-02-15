function [Xclean,removed_indices] = cleanForPlot(X3d)
% Removes the 1% most extreme values in each dimension.
% X3d - 3xN-array with the points to clean
% Xclean - Cleaned points.
% removed_indices - The indices of the removed points.

minvals = quantile(X3d,0.01,2);
maxvals = quantile(X3d,0.99,2);

removed_indices = X3d(1,:) > maxvals(1,:) | X3d(1,:) < minvals(1,:);
for kk = 2:3
    removed_indices = removed_indices | X3d(kk,:) > maxvals(kk,:) | X3d(kk,:) < minvals(kk,:);
end

Xclean = X3d(:,~removed_indices);
