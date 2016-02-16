function errors = reprojectionErrors(Ps, xs, X)
%takes N camera matrices, Ps, N image points, xs, and a 3D point, X and 
%computes a vector with the reprojection errors
N = length(Ps);
x_hat = zeros(2,N); % initialization
errors = zeros(N,1);
for i = 1:N
    lambdax = Ps{i}*[X;1];
    % derive the estimated image point
    x_hat(:,i) = [lambdax(1)/lambdax(3);lambdax(2)/lambdax(3)];
    % calculate the absolute residual error
    errors(i) = norm(xs(:,i) - x_hat(:,i));
end
% If a point has negative depth, set the reprojection error to Inf.
errors(checkDepths(Ps, X) == false) = Inf;
end

