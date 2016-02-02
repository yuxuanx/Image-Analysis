%% Filtering and simple detectors
image = readAsGrayScale('checkerboard.png');
figure
imagesc(image);
colormap gray
[ row_coords, col_coords ] = detectIntersections( image );
figure;plot(col_coords, row_coords,'r*');
%% Non-maximum suppression
f_median = ordfilt2(image,5,ones(3,3)); % median filter
f_maxima = ordfilt2(image,9,ones(3,3)); % maximum filter
%% Cell detecting
% Reading multiple images
% for image_nbr = 1:50
% image_name = ['cell_' num2str(image_nbr) '.png'];
% end
% dir('cell_examples/*.png');
image = readAsGrayScale('bloodcells.jpg');
figure
imagesc(abs(image));
colormap gray
figure
detectcells(image);
%% No purple cells
image = im2double(imread('bloodcells.jpg'));
blueImage = image(:,:,3);
figure
imagesc(abs(blueImage));
colormap gray
figure
detectcells(blueImage);
%% Ex 1.11
A = [-1 -0.5 0 0.5 1];
B = [-2 -1 0 1 2]';
C = imfilter(A,B,'conv','full');
d = det(C); % always 0
% When the determinant of a matrix is zero, the rows of the matrix are
% linearly dependent vectors, so are the columns. This happens because the
% generated filter is a convolution of two vectors. A N * N filter should be
% expressed as the outer product of two vectors to make it seperable. 
%% Ex 1.12
% a two-dimensional Gaussian image has projections that are also Gaussians. 
% The image and projection Gaussians have the same standard deviation. 

% Filtering an M-by-N image with a P-by-Q filter kernel requires roughly 
% MNPQ multiplies and adds (assuming we aren't using an implementation 
% based on the FFT). If the kernel is separable, you can filter in two 
% steps. The first step requires about MNP multiplies and adds. 
% The second requires about MNQ multiplies and adds, for a total of MN(P + Q).
% The computational advantage of separable convolution versus nonseparable 
% convolution is therefore: PQ/(P+Q). For a 30*30 filter, the speed up is 
% 30*30/(30+30) = 15
%% Ex 1.13
% ???