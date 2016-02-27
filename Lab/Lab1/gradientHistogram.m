function [ histogram ] = gradientHistogram(vertical_derivative, horizontal_derivative)
%places each gradient into one of eight orientation bins.
bins = atan2(horizontal_derivative, vertical_derivative);
histogram = zeros(8,1); % initialization
% each orientation is the length of gradients in that area
histogram(1) = sum(sqrt(horizontal_derivative((bins>=0)&(bins<=pi/4)).^2 + vertical_derivative((bins>=0)&(bins<=pi/4)).^2));
histogram(2) = sum(sqrt(horizontal_derivative((bins>pi/4)&(bins<=pi/2)).^2 + vertical_derivative((bins>pi/4)&(bins<=pi/2)).^2));
histogram(3) = sum(sqrt(horizontal_derivative((bins>pi/2)&(bins<=3*pi/4)).^2 + vertical_derivative((bins>pi/2)&(bins<=3*pi/4)).^2));
histogram(4) = sum(sqrt(horizontal_derivative((bins>3*pi/4)&(bins<=pi)).^2 + vertical_derivative((bins>3*pi/4)&(bins<=pi)).^2 ));
histogram(5) = sum(sqrt(horizontal_derivative((bins>=-pi)&(bins<-3*pi/4)).^2 + vertical_derivative((bins>=-pi)&(bins<-3*pi/4)).^2));
histogram(6) = sum(sqrt(horizontal_derivative((bins>=-3*pi/4)&(bins<-pi/2)).^2 + vertical_derivative((bins>=-3*pi/4)&(bins<-pi/2)).^2));
histogram(7) = sum(sqrt(horizontal_derivative((bins>=-pi/2)&(bins<-pi/4)).^2 + vertical_derivative((bins>=-pi/2)&(bins<-pi/4)).^2));
histogram(8) = sum(sqrt(horizontal_derivative((bins>=-pi/4)&(bins<0)).^2 + vertical_derivative((bins>=-pi/4)&(bins<0)).^2));
% histogram = abs(histogram);

end

