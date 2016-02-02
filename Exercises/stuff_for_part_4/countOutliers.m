function [ loss ] = countOutliers(distances, threshold)
%counts the number of outliers given the distances to the line.
loss = length(find(distances>threshold));


end

