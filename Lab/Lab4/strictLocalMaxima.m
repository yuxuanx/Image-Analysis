function [ row_coords, col_coords ] = strictLocalMaxima( image )
f_maxima = ordfilt2(image,9,true(3),'symmetric'); % maximum filter
indicator1 = (image == f_maxima);
f_maxima = indicator1 .* f_maxima;
% threshold detection
[row_coords, col_coords] = find(abs(f_maxima) > 0);

end

