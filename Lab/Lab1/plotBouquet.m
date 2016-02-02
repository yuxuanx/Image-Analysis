function plotBouquet(img,std)

% Computes a histogram of gaussian gradients for the image img.
% std is the standard deviation of the gaussians.

% Clear figure
clf
% Figure background white
% figure('Color',[1 1 1]);
% Subplot, 1 row, 2 columns, nbr 1 is active
subplot(121)
% Draw image in active part
imagesc(img)
colormap gray
hold on
axis image

% Compute gaussian derivatives
[vertical_derivative, horizontal_derivative] = gaussianGradients(img,std);

% Plot gradients in red with thicker lines
quiver(horizontal_derivative,vertical_derivative,'r','LineWidth',2)

% Compute histogram
histogram = gradientHistogram(vertical_derivative, horizontal_derivative)


% Set second subplot as active
subplot(122)
hold on
% No coordinate axes
axis off

% Compute central angles for the eight histogram bins
angles = pi/8 + (0:1:7)*pi/4;
% Variable to determine a good size for the plot window
max_val = 0.1;
% Plot a vector of the right length for each bin
for kk = 1:8
    vec = histogram(kk)*[cos(angles(kk)) sin(angles(kk))]; 
    quiver(0, 0, vec(2), vec(1),'r','LineWidth',2)
    
    max_val = max(max_val, max(abs(vec)));
end

% We want coordinate axes to point as they do for images
set (gca,'Ydir','reverse')
axis image
% Set plot window size
axis([-max_val max_val -max_val max_val])

% Plot some guiding lines.
plot([-max_val max_val], [0, 0], 'k:')
plot([0, 0], [-max_val max_val], 'k:')

