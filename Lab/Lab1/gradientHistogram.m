function [ histogram ] = gradientHistogram(vertical_derivative, horizontal_derivative)
%places each gradient into one of eight orientation bins.
bins = atan2(horizontal_derivative, vertical_derivative);
histogram = zeros(8,1); % initialization
% each orientation is the summation of gradients in that area
histogram(1) = sum(bins((bins>=0)&(bins<=pi/4)));
histogram(2) = sum(bins((bins>pi/4)&(bins<=pi/2)));
histogram(3) = sum(bins((bins>pi/2)&(bins<=3*pi/4)));
histogram(4) = sum(bins((bins>3*pi/4)&(bins<=pi)));
histogram(5) = sum(bins((bins>=-pi)&(bins<-3*pi/4)));
histogram(6) = sum(bins((bins>=-3*pi/4)&(bins<-pi/2)));
histogram(7) = sum(bins((bins>=-pi/2)&(bins<-pi/4)));
histogram(8) = sum(bins((bins>=-pi/4)&(bins<0)));
histogram = abs(histogram);

end

