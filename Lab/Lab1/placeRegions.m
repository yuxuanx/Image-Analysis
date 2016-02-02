function [centres, halfwidths] = placeRegions(position)
%creates 3*3 regions symmetrically around position, and outputs the
%coordinates of the centre points and halfwidths of each region
halfwidths = ones(1,9)*6; % each region's half width is 6
x = position(1);
y = position(2);
% each region is the size of [12,12] with 2 overlap
tap = 7;
Xcentre = repmat([x-tap,x,x+tap],1,3);
Ycentre = [y-tap,y-tap,y-tap,y,y,y,y+tap,y+tap,y+tap];
centres = [Xcentre; Ycentre];
end

