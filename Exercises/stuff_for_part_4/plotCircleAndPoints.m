function plotCircleAndPoints(img,centre,radius,points)
% Plot a circle and points in an image
% img -- the image (color or grayscale)
% centre -- 2x1 array with the circle centre
% radius -- circle radius
% points -- 2xN array with the point coordinates.

% Render the image
imagesc(img)

% Check if grayscale
if size(img,3)==1
    colormap gray
end
    
hold on

plot(points(2,:),points(1,:),'r.')

rows = centre(1) + radius*cos(0:0.01:2*pi);
cols = centre(2) + radius*sin(0:0.01:2*pi);

plot(cols, rows, 'g')