function [f, c] = doEpoch(f, c, examples, labels)
%begins by making a random reordering of the
%training examples and then goes through them 
%in order performing a stochastic gradient descent step for each example.
N = length(examples);
% reordering the data
newOrder = randperm(N);
examples = examples(newOrder);
labels = labels(newOrder);

% go through and update the f and c using particalGradient
for i = length(examples)
[fgrad, cgrad] = partialGradient(f, c, examples{i}, labels(i));
f = f - fgrad;
c = c - cgrad;
end

end

