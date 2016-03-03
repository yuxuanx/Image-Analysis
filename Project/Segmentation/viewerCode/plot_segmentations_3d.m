function plot_segmentations_3d(segmentations,voxdims,colors)


for kk = 1:length(segmentations)
    color = colors{mod(kk-1,3)+1};
    patch(isosurface(segmentations{kk},0.5),'FaceColor',color,'FaceAlpha',1,'EdgeColor','none');
end


daspect(1./voxdims);
camlight
lighting phong
hold on