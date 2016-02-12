function warped = warp16x16(source)
%warps source according to transformCoordinates and forms an output 16*16 
%image warped
warped = zeros(16,16);
for i = 1:16
    for j = 1:16
    warped(i,j) = sampleImageAt(source, transformCoordinates([i,j]));
    end
end
end

