function [examples, labels] = extractExamples(img, positives, negatives)
%extract example patches
%   input: an image, 2?M-array of positions indicating positive examples
%   and a 2?N-array of positions indicating negative examples
%   output: a cell array with all the example patches 
%   and 1D array with the labels of each of the examples.
M = length(positives);
N = length(negatives);
img = preProcess(img); % normalize image intensities
labels = true(M+N,1); % initialization
examples = cell(M+N,1); 
patch_halfwidth = (29-1)/2;
% get positive patches
for i = 1:M
    examples{i} = getPatch( img, positives(:, i), patch_halfwidth );
end
% get negative patches
for i = M+1:M+N
    examples{i} = getPatch( img, negatives(:, i - M), patch_halfwidth );
end
labels(M+1:M+N) = false;
end

