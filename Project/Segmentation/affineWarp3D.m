function warped = affineWarp3D(target_imsize,source,A,t)
% warped = affineWarp(target_imsize, source, A, t)
% warps the source image producing an image of size target_imsize
% A,t should be a coordinate transfomation from target to source!

% Matlab will invert the matrix, for you to see what really happens,
% I uninvert it first.
T = inv([A t;0 0 0 1]);

% As usual Matlab makes a mess of coordinate order
A = affine3d(T([2 1 3 4],[2 1 3 4])');

% Tell Matlab the size and placement of the output
output_view = imref3d(target_imsize);

% And, finally (!), perform the warping
warped = imwarp(source,A,'nearest','OutputView',output_view);
