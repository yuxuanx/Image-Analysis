clc;clear
load('sequence.mat');
threshold = 5;
nbr_examples = 5000; % number of cell samples used
Xlist = zeros(3,1);
% using for loop to go through triangulation samples
for i = 1:nbr_examples
    Ps = triangulation_examples(i).Ps;
    xs = triangulation_examples(i).xs;
    % implements triangulation using Ransac
    %[X, nbr_inliers] = ransacTriangulation(Ps, xs, threshold);
    [X, loss, nbr_inliers] = triangulatePoint_modify(xs, Ps, threshold);
    % store all triangulated points with at least two inliers
    if nbr_inliers >=2
        if Xlist(:,1) == zeros(3,1)
            Xlist = X;
        else
            Xlist = [Xlist X];
        end
    end
end 
Xlist = cleanForPlot(Xlist);
scatter3(Xlist(2,:),Xlist(1,:),Xlist(3,:),'.')
axis equal