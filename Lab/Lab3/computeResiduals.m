function all_residuals = computeResiduals(Ps, xs, X)
%takes a cell list with N cameras, a 2 ? N array of image points and a 
%3 * 1 array X and computes a 2N ? 1 array with all the reprojection 
%residuals stacked into a single vector/array.
N = length(Ps);
x_hat = zeros(2,N); % initialization
all_residuals = zeros(2*N,1);
for i = 1:N
    lambdax = Ps{i}*[X;1];
    % derive the estimated image point
    x_hat(:,i) = [lambdax(1)/lambdax(3);lambdax(2)/lambdax(3)];
    % calculate the residuals
    all_residuals(2*i-1:2*i) = xs(:,i) - x_hat(:,i);
end

