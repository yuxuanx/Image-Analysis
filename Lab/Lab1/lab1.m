%% Gradient histgrams
img = readAsGrayScale( 'bowie.jpg' );
plotBouquet(img, 3.0);

%% A SIFT-like descriptor
load digits.mat
plotSquares(img, [100,100]);

%% Digit classification
