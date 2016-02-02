function [ patch ] = getPatch( image, position, patch_halfwidth )
% takeing out a patch from the image centred at position with a range position
% +/- patch_halfwidth
[m,n] = size(image);
xLeft = position(1) - patch_halfwidth; 
xRight = position(1) + patch_halfwidth;
yLeft = position(2) - patch_halfwidth;
yRight = position(2) + patch_halfwidth;
% if the patch doesn?t fit inside the image, return an error
if (xLeft <= 0) || (yLeft <= 0) || (xRight > m) || (yRight > n)
    error('Patch outside image borders');
else
    % assign the corresponding values to get the patch
    patch = image(xLeft : xRight, yLeft : yRight);
end
end

