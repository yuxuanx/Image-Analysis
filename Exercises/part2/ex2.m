%% Ex 2.1
T = [0 0 5;0 3 5;0 0 5];
T = T - ones(size(T)).*mean(T(:));