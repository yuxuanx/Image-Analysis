function [ row_coords, col_coords ] = detectIntersections( image )
% filter design (cascaded)
fdiff1 = [-0.5 0 0.5];
fdiff2 = [-0.5 0 0.5]';
% response = imfilter(image, fdiff1);
% response2 = imfilter(response, fdiff2);
% filter design (single)
filter = [1 0 -1;0 0 0;-1 0 1];
response = imfilter(image, filter, 'symmetric');
figure
imagesc(abs(response));
colormap gray
% non maximum suppression
[row_coords, col_coords] = strictLocalMaxima(response);

end

