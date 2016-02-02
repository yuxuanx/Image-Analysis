function plotLineAndPoints(img, a, b, c, points)

% plotLineAndPoints(img, a, b, c, points)
% plots points and the line given by a*u + b*v + c = 0 in the image img

% Draw image
imagesc(img)
hold on

plot(points(2,:),points(1,:),'b.')


% Image boundaries
bnds = [1 size(img,1) 1 size(img,2)];

% If clause to avoid dividing by a very small number.
if (abs(a) > abs(b))
    plot(bnds([3 4]), -[(b*bnds(3)+c) (b*bnds(4)+c)]/a, 'r-')
else
    plot(-[(a*bnds(1)+c) (a*bnds(2)+c)]/b, bnds([1 2]), 'r-')
end

% Set axis to only view image region.
axis(bnds([3 4 1 2]))