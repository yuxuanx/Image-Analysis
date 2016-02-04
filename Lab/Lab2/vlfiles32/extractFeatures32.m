function [frames,descriptors] = extractFeatures32(img, rotation_invariance)
% This functions builds SIFT-descriptors around interest points defined by
% input varaible points.
% INPUT:
% img - the grayscale image. 
% points - a 3xN matrix. Each point is one column in this matrix, 
% like this: [row; column; scale]
% OUTPUT:
% frames - a 4xM matrix containing point data [row; column; scale;
% orientation].
% descriptors - a 128xM matrix, where the i-th column is the
% SIFT-descriptor for the i-th point in output frames.
%
% This file is based on VLSIFT-functions.

if nargin < 3
	rotation_invariance = false;
end

% Set up image.
img = single(img) / max(img(:));

% Perform extraction
[frames,descriptors] = vl_sift(img);

if ~rotation_invariance
    frames(4,:)=0;
	[frames,descriptors] = vl_sift(img, 'Frames', frames);
end	
frames = frames([2 1 3 4],:);

% Normalize descriptors.
descriptors = single(descriptors);
for i = 1:size(descriptors,2)
    nn = norm(descriptors(:,i));
    if (nn > 0)
    	descriptors(:,i) = descriptors(:,i)/nn;
    end
end


