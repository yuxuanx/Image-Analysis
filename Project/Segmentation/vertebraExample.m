% Add code for reading images
addpath('niiTools')
addpath('viewerCode')

% Print help for the viewer
help quadViewer

% Cd to the Segmentation folder
data_folder = 'vertebrae/';

% Id of the image to load
id = 2;

% Load image and meta data
image_nii = load_untouch_nii([data_folder 'case' int2str(id) '.nii']);
image = image_nii.img;

% Load segmentation
seg_nii = load_untouch_nii([data_folder 'case' int2str(id) '_segmentation.nii']);
segmentation = seg_nii.img;

% Load features
features = load([data_folder 'case' int2str(id) '_features.mat']);

% Visualize the image and vertebras L4 and L5 and some feature positions
% (first 100 in cyan, the rest in yellow)
quadViewer(image, {segmentation==504 segmentation==505}, features.positions(:,1:100), features.positions(:,101:200))

% Visualize the image and vertebra T12
quadViewer(image, segmentation==412)

