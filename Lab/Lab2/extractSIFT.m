function [points,descriptors] = extractSIFT(img, upright)
% descriptors = extractSIFT(img, upright)
%
% This functions finds SIFT points and descriptors
% INPUT:
% img - a grayscale image in datatype single or double. 
% OUTPUT:
% points - a 2xN matrix
% descriptors - a Nx128 matrix, where the i-th row is the
% SIFT-descriptor for the i-th point 
% The descriptors are normalized to unit length.
%
% The code is borrowed from VLFEAT.

if nargin < 2
	upright = false;
end

% Some checks.
if size(img,3) >1
    img = mean(img,3);
	warning('Converting to grayscale');
end

% Add a path to the subdirectory where VLFEAT-functions are placed.
% Try to figure out if a 32 or 64 bit version is used.
cc = computer;
if strcmp(cc(end-1:end),'32')
    thisDir = fileparts(mfilename('fullpath'));
 	oldPath = addpath([thisDir filesep 'vlfiles32']);
	[points,descriptors] = extractFeatures32(img, upright);
else
    thisDir = fileparts(mfilename('fullpath'));
 	oldPath = addpath([thisDir filesep 'vlfiles64']);
	[points,descriptors] = extractFeatures64(img, upright);
end	

path(oldPath);

points = points(1:2,:);
descriptors = descriptors';
