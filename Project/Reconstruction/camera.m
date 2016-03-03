f = 5.8e-3; % focus length 
senser_width = 5.75e-3;
pv = 1408/2;
pu = 1056/2;
pixel_size = senser_width/pv/2;

% inverse of the camera calibration matrix
K_inv = [1 0 -pu;0 1 -pv;0 0 f/pixel_size];

