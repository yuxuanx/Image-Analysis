function [vertical_derivative, horizontal_derivative] = gaussianGradients(img, std)
%takes an image and estimates both gaussian derivatives for each pixel.
% gaussiaan lowpass filter of default size [12, 12] and standard deviation std
% gauss = fspecial('gaussian',[3, 3] , std);
% % returns the numerical gradient of the matrix gauss
% [f_vertical, f_horizontal] = gradient(gauss);   
% horizontal_derivative = imfilter(img, f_horizontal,'symmetric');
% vertical_derivative = imfilter(img, f_vertical,'symmetric');
gauss = gaussianFilter( img, std );
[vertical_derivative, horizontal_derivative] = gradient(gauss); 


end

