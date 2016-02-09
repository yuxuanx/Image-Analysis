function [source_pts, target_pts, A_true, t_true, outlier_percent] = affineTestCase_modify( outlier_rate )
%generates a test case for estimating an affine transformation.
N = 500; % number of source points
source_pts = [randi(N,1,N);randi(N,1,N)]; % generate source points randomly
% generate A_true uniformly random in [-2,2]
A_true = [-2+4*rand -2+4*rand;-2+4*rand -2+4*rand];
% generate t_true uniformly random in [-100,100]
t_true = [-100+randi(200);-100+randi(200)];
% replicate to make it the same size as source_pts
t_true = repmat(t_true,1,500);
target_pts = A_true*source_pts + t_true;

r1 = upsample(source_pts(1,:),2)';
r2 = upsample(source_pts(2,:),2)';
r3 = upsample(ones(N,1),2);
r4 = upsample([1 source_pts(1,:)],2)';
r4 = r4(2:end-1);
r5 = upsample([1 source_pts(2,:)],2)';
r5 = r5(2:end-1);
r6 = r3(end:-1:1);
M = [r1 r2 r3 r4 r5 r6];
theta = [A_true(1);A_true(3);t_true(1);A_true(2);A_true(4);t_true(2)];
b = reshape(target_pts,2*N,1);
r = M * theta - b;

end

