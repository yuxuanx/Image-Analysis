function [ label ] = classifyDigit(digit_image, digits_training)
%computes a descriptor for the given digit image, goes through all the 
%digits in digits_training to find the one with the most similar descriptor
%and outputs the label of that digit.
run('prepareDigits'); % get descriptors of training data
eucDist = zeros(length(digits_training),0); % initialization
% derive the descriptor of the target image
desc_image = gradientDescriptor(digit_image, [15,15]);
% calculate the euclidean distance between the target image and training
% datas
for i=1:length(digits_training)
    eucDist(i) = norm(desc_image - digits_training(i).descriptor);
end
% select the minimum one, get its index
[~,I] = min(eucDist);
label = digits_training(I).label;
age = label;
%disp(['I am ' num2str(age) ' years old'])
end

