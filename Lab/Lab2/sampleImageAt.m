function value = sampleImageAt(img, position)
%gives the pixel value at position
[rowBound, colBound] = size(img);
% select the cloest position
rowPosition = round(position(1));
colPosition = round(position(2));
if rowPosition <= rowBound && colPosition <= colBound && ...
        rowPosition ~= 0 && colPosition ~= 0
    value = img(rowPosition,colPosition);
% if it is outside the image, return 1 (=white)
else
    value = 1;
end

end

