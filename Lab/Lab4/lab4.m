%% Ex 4.2
cellImage = readAsGrayScale( 'CNN/dataset/bloodcells/bloodcells_1.png' );
f = zeros(29); % filter choosing
f(1,1) = 1;f(1,29) = -1;f(29,1) = -1;f(29,29) = 1;
c = 5; % threshold choosing
p = filterClassifier(f, c, cellImage);

%% Ex 4.3
[ row_coords, col_coords ] = strictLocalMaxima( p );
imagesc(p); colormap gray; axis image; hold on;
plot(col_coords, row_coords,'y*');

%% Ex 4.4
% 8, 9, 3
% the gradient of y respect to the filter looks like a patch of the image
% centered at (u, v) with the same size of the filter

%% Ex 4.5
load('training_data.mat');
img = preProcess(img);

%% 