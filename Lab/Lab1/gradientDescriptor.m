function [ desc ] = gradientDescriptor(image, position)
%computes a SIFT-like descriptor at a certain position
[centres, halfwidths] = placeRegions(position);
histogram = zeros(9,8); % initialization
for i = 1:9
patch = getPatch( image, centres(:,i), halfwidths(i) );
[vertical_derivative, horizontal_derivative] = gaussianGradients(patch, 3.0);
histogram(i,:) = gradientHistogram(vertical_derivative, horizontal_derivative);
end
histograms = reshape(histogram,8*9,1); % stack the histograms into a longer vector
desc = histograms/max(histograms); % normalization
end

