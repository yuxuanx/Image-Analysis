function [f, c] = momentum(f, c, examples, labels)
%uses momentum to optimize process
gamma = 0.3; % size of momentum
mu = 0.8; % learning rate

% initialization of momentum
fg = zeros(size(f)); 
cg = 0;

N = length(examples);
% reordering the data
newOrder = randperm(N);
examples = examples(newOrder);
labels = labels(newOrder);

% go through and update the f and c using momentum
for i = length(examples)
[fgrad, cgrad] = partialGradient(f, c, examples{i}, labels(i));

fg = gamma*fg - (1-gamma)*fgrad;
f = f - mu*fg;
cg = gamma*cg - (1-gamma)*cgrad;
c = c - mu*cg;
end

end

