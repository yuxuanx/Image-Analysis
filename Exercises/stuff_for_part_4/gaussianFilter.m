function [ imgFilt ] = gaussianFilter( img, std )
%image filtered with a Gaussian filter of the specified standard deviation.
% Hint: The filter halfwidth should be at least two standard deviations 
% not to loose precision.
imgFilt = imgaussfilt(img, std);



end

