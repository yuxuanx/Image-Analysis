function [ p ] = filterClassifier(f, c, image)
%implements the minimal network

% computes filter response
filterResponse = imfilter(image, f, 'symmetric');
% adds a bias
y = filterResponse + c;
% sends it through a soft-max function
p = exp(y)./(1+exp(y));
p = softmax(p);

end

