function [fgrad, cgrad] = partialGradient(f, c, example, label)
%computes the derivatives of the partial loss Li
%with respect to each of the filter parameters and the constant c.
example = preProcess(example);
p = filterClassifier(f, c, example);

[xSize, ySize] = size(p);
% take out the center point of probability map
p_center = p((xSize+1)/2, (ySize+1)/2);
% assign the gradient with respect to f and c according to the sign of
% examples
if label == true
    fgrad = (p_center - 1).*example;
    cgrad = p_center - 1;
else
    fgrad = p_center.*example;
    cgrad = p_center;

end

