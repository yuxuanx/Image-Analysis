function switchPlot(target, warped, nbr_of_times)

if nargin < 3
    nbr_of_times = 10;
end

figure(gcf)
clf
imagesc(target)
axis image
axis off
for kk = 1:nbr_of_times
    plotOne(target) 
    plotOne(warped)
end
end

function plotOne(img)

imagesc(img);
axis image
axis off
if size(img,3) == 1
    colormap gray
else
    colormap default
end
pause;
end