clc
clear
load('digits.mat');
len = length(digits_validation);
label = zeros(1,len);
for j=1:len
    % find the most similar descriptor, return the label
    label(j) = classifyDigit(digits_validation(j).image, digits_training);
end
% find correct match
correctNum = length(find(label==[digits_validation.label]));
correctRate =correctNum/len; % calculate the correct rate