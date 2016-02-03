function [label, name] = classifyChurch(image, feature_collection)
%classifies a new image by computing feature points for the new image, 
%matching them to the features in the list and letting each match vote for 
%the correct church. 
% detect interest points and mark their locations
points = detectSURFFeatures(image); 
% extract interest point descriptors
[features, ~] = extractFeatures(image,points);
% return indices to the features most likely to correspond between the
% two input feature matrices. 
indexPairs = matchFeatures(features, feature_collection.descriptors, 'MaxRatio', 0.6);
% get the corresponding descriptors's indices in feature_collection
list = feature_collection.labels(indexPairs(:,2));
b = 1:max(list); % find the most frequent label in list
c = histc(list,b);
[~, max_index] = max(c);
label = b(max_index);
% return the linking name
name = feature_collection.names(label);
end

