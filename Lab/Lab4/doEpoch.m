function [f, c] = doEpoch(f, c, examples, labels)
%begins by making a random reordering of the
%training examples and then goes through them 
%in order performing a stochastic gradient descent step for each example.
N = length(examples);
newOrder = randperm(N);
examples = examples(newOrder);
labels = labels(newOrder);
[fgrad, cgrad] = partialGradient(f, c, example, label);

end

