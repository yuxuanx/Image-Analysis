function positive = checkDepths(Ps, X)
%takes N camera matrices, Ps, and a 3D point, X and checks the depth of X 
%in each of the cameras.
% inputs multiple cells of camera matrixs
% outputs boolean values
lambda = true(length(Ps),1); % initialization
for i = 1:length(Ps)
    lambdax = Ps{i}*[X;1];
    % make decision based on the last entry
    lambda(i) = lambdax(end);
end
% if lambda is negative, return false
lambda(lambda<0) = false;
positive = lambda;
end

