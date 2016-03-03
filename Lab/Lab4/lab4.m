%% Ex 4.2
cellImage = readAsGrayScale( 'CNN/dataset/bloodcells/bloodcells_1.png' );
f = zeros(29); % filter choosing
c = 0; % threshold choosing
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
clc;clear
load('training_data.mat');
img = preProcess(img);

%% Ex 4.7
[examples, labels] = extractExamples(img, positives, negatives);

%% Ex 4.8
[fgrad, cgrad] = partialGradient(f, c, examples{1}, labels(1));

%% Ex 4.10
% initialization
f = zeros(29);
c = 0; 
% run 10 epochs on the training examples
for i = 1:10
    [f, c] = doEpoch(f, c, examples, labels);
end

%% Ex 4.12 (momentum)
% initialization
f = zeros(29);
c = 0; 
gamma = 0.7; % size of momentum
mu = 0.01; % learning rate
% run 10 epochs on the training examples
for i = 1:10
    [f, c] = momentum(f, c, examples, labels, gamma, mu);
end

%% Ex 4.11
load('validation_image.mat');
image = preProcess(image_validation);
probmap = filterClassifier(f, c, image);
viewWithOverlay(image, probmap);
colormap gray