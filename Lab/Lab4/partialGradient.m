function [fgrad, cgrad] = partialGradient(f, c, example, label)
%computes the derivatives of the partial loss Li
%with respect to each of the filter parameters and the constant c.
example = preProcess(example);
p = filterClassifier(f, c, example);
% the expression of gradiant of partial loss is different with positive and
% negative examples
if label == true
    fgrad = -(1-p).*example;
else
    fgrad = -p.*example;
    

    
end

