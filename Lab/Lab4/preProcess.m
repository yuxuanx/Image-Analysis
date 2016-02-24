function img = preProcess(img)
%normalizes the image intensities
%   roughly to the interval [-1,1]
% take out the maximum and minimum value
maximum = max(img(:));
minimum = min(img(:));
% normalization, transfer from region [min, max] to [-1, 1]
img = (img - minimum)*2/(maximum - minimum) - 1;


end

