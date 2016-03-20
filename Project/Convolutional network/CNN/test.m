clc;clear
% press Enter/Return to stop
annotatedPoints = mousePick('dataset/blackbeans/sample_3.jpg');
savefile = 'dataset/blackbeans/annotations/negative_samples_3.mat';
save(savefile,'annotatedPoints');
