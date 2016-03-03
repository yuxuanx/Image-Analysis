function [f, c] = doEpoch(f, c, examples, labels)
%begins by making a random reordering of the
%training examples and then goes through them 
%in order performing a stochastic gradient descent step for each example.
N = length(examples);
mu = 0.01; % learning rate
% reordering the data
newOrder = randperm(N);
% examples = examples(newOrder);
% labels = labels(newOrder);

% go through and update the f and c using particalGradient
for i = 1:length(examples)
[fgrad, cgrad] = partialGradient(f, c, examples{newOrder(i)}, labels(newOrder(i)));
f = f - mu*fgrad;
c = c - mu*cgrad;
end

end

