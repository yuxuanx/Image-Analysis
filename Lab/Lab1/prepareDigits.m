load('digits.mat')
histogram = zeros(8*9, length(digits_training)); % initialization 
% for each image in digits_training, derive its SIFT descriptor
for i = 1 : length(digits_training)
% add the new kind descriptor to the struct
digits_training(i).descriptor = gradientDescriptor(digits_training(i).image, [15,15]);
end
