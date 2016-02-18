%% Ex 3.1
noise = 0.1; % standard deviation of noise level
[Ps, xs, X_true] = triangulationTestCase(noise);
%% Ex 3.2
positive = checkDepths(Ps, X_true);
%% Ex 3.3
errors = reprojectionErrors(Ps, xs, X_true);
%% Ex 3.6
% ri(X) = (aiX/ciX;biX/ciX)-xi, if ciX > 0
%% Ex 3.7
all_residuals = computeResiduals(Ps, xs, X_true);