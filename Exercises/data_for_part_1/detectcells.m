function [ row_coords, col_coords ] = detectcells( im )
for image_nbr = 1:50
cellSample = readAsGrayScale(['cell_' num2str(image_nbr) '.png']);
cellSample(abs(cellSample) > 0.7) = 1;
cellSample(abs(cellSample) <= 0.7) = 0;
cellSample = cellSample - ones(size(cellSample)).*mean(cellSample(:));
response = imfilter(im, cellSample, 'symmetric');

% non maximum suppression
f_maxima = ordfilt2(response,9,true(3),'symmetric'); % maximum filter
indicator = (response == f_maxima);
f_maxima = indicator .* f_maxima;

[ row_coords, col_coords ] = find(abs(f_maxima) > 10);
plot(col_coords, row_coords,'r*');hold on
end
end

