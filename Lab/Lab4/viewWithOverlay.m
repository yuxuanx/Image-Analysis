function viewWithOverlay(img, overlay)

img = double(img)/max(img(:));

view_image = zeros([size(img,1) size(img,2) 3]);

view_image(:,:,1) = img;
view_image(:,:,2) = max(img,overlay);
view_image(:,:,3) = img;

imagesc(view_image)
axis image