function [ row_coords, col_coords ] = strictLocalMaxima( image )
f_maxima = ordfilt2(image,9,true(3),'symmetric'); % maximum filter
f_minima = ordfilt2(image,1,true(3),'symmetric'); % minimum filter
indicator1 = (image == f_maxima);
indicator2 = (image == f_minima);
f_maxima = indicator1 .* f_maxima;
f_minima = indicator2 .* f_minima;
imageNonMaxSupp = f_maxima + f_minima;
% threshold detection
[row_coords, col_coords] = find(abs(imageNonMaxSupp) > 0.4);

end

