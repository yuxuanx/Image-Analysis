function annotatedPoints = mousePick(imagePath)
image = im2double(imread(imagePath));
annotatedPoints = annotate_cells(image);
end


