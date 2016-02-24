function warped = alignImages(source, target)
%uses SIFT and Ransac to align the source image to the target image
% extract SIFT of both source and target images
% sourcePoints = detectMinEigenFeatures(source);
% targetPoints = detectMinEigenFeatures(target);
% [sourceFeatures, sourcePositions] = extractFeatures(source, sourcePoints);
% [targetFeatures, targetPositions] = extractFeatures(target, targetPoints);
[sourcePositions, sourceFeatures] = extractSIFT(source,true); 
[targetPositions, targetFeatures] = extractSIFT(target,true); 
% match features of source and target images
correspondences = matchFeatures(sourceFeatures,targetFeatures, 'MaxRatio', 0.8, 'MatchThreshold', 100);
% find matched points from correspending pairs
matchedSource = sourcePositions(:,correspondences(:, 1));
matchedTarget = targetPositions(:,correspondences(:, 2));
% using affine and ransec to derive transformation
%[A, t] = ransacFitAffine(matchedTarget, matchedSource, 1);
% affine using least squares
[A, t] = leastSquaresAffine(matchedTarget, matchedSource);
% warp the source image 
warped = affineWarp(size(target), source, A, t);

end

