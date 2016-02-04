function warped = affineWarp(target_imsize,source,A,t)

% warped = affineWarp(target_imsize, source, A, t)

% Matlab will invert the matrix, for you to see what really happens,
% I uninvert it first.
T = inv([A t;0 0 1]);

% As usual Matlab makes a mess of coordinate order
A = affine2d(T([2 1 3],[2 1 3])');

% Tell Matlab the size and placement of the output
output_view = imref2d(target_imsize);

% And, finally (!), perform the warping
warped = imwarp(source,A,'OutputView',output_view);
