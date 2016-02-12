function warped = alignImages(source, target)
%uses SIFT and Ransac to align the source image to the target image
% extract SIFT of both source and target images
% sourcePoints = detectSURFFeatures(source);
% targetPoints = detectSURFFeatures(target);
% [sourceFeatures, sourcePositions] = extractFeatures(source, sourcePoints);
% [targetFeatures, targetPositions] = extractFeatures(target, targetPoints);
[sourcePositions, sourceFeatures] = extractSIFT(source); 
[targetPositions, targetFeatures] = extractSIFT(target); 
% match features of source and target images
correspondences = matchFeatures(sourceFeatures,targetFeatures, 'MaxRatio', 0.8, 'MatchThreshold', 100);
% find matched points from correspending pairs
matchedSource = sourcePositions(:,correspondences(:, 1));
matchedTarget = targetPositions(:,correspondences(:, 2));
% using affine and ransec to derive transformation
[A,t] = ransacFitAffine(matchedSource, matchedTarget, 1);
%[A,t] = leastSquaresAffine(matchedSource, matchedTarget);
% warp the source image 
warped = affineWarp(size(target), source, A, t);

end

