clc;clear
load('sequence.mat');
threshold = 5;
nbr_examples = 1000;
Xlist = zeros(3,1);
for i = 1:nbr_examples
    Ps = triangulation_examples(i).Ps;
    xs = triangulation_examples(i).xs;
    [X, nbr_inliers] = ransacTriangulation(Ps, xs, threshold);
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