function [ grayImage ] = readAsGrayScale( imagePath )
image = im2double(imread(imagePath));
grayImage = mean(image,3);
end

