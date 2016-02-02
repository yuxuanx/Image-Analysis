function plotSquares(img, position)

% plotSquares plots the squares indicated by centres and halfwidths in
% the image img.
% centres - 2xn array of centre coordinates
% halfwidths 1xn array of square halfsize. The squares will have size
% (2*halfwidths + 1) x (2*halfwidths + 1)

% Clear plot window
clf
% Draw image
imagesc(img)
axis image
colormap gray
hold on

[centres, halfwidths] = placeRegions(position);

plot(position(2),position(1),'x', 'Color', [1 0.5 0], 'MarkerSize', 12, 'LineWidth',2)

nbr_squares = size(centres,2)

for kk = 1:nbr_squares
    
    row_vals = centres(1,kk) + halfwidths(kk)*[-1 -1  1  1 -1];
    col_vals = centres(2,kk) + halfwidths(kk)*[-1  1  1 -1 -1];
    plot(col_vals, row_vals, 'Color',[1 0.5 0], 'LineWidth', 2);
end

axis([1 size(img,2) 1 size(img,1)])