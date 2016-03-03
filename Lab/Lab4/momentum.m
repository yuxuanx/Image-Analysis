function [f, c] = momentum(f, c, examples, labels, gamma, mu)
%uses momentum to optimize process
% input: gamma: size of momentum; mu: learning rate


% initialization of momentum
fg = zeros(size(f)); 
cg = 0;

N = length(examples);
% reordering the data
newOrder = randperm(N);
% examples = examples(newOrder);
% labels = labels(newOrder);

% go through and update the f and c using momentum
for i = 1:length(examples)
[fgrad, cgrad] = partialGradient(f, c, examples{newOrder(i)}, labels(newOrder(i)));

fg = gamma*fg + (1-gamma)*fgrad;
f = f - mu*fg;
cg = gamma*cg + (1-gamma)*cgrad;
c = c - mu*cg;
end

end

