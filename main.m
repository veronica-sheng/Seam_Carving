function main 
im = imread('prague.jpg');
figure,imshow(im);
title('Original Image');


im1 = imread('prague.jpg');
energyImage1 = energy_image(im1);
for i=1:100;
    [im1, energyImage1] = reduceHeight(im1, energyImage1);
end
figure,imshow(im1);
title('Seam Carving');



[row1, col1, ~] = size(im);
im2 = imresize(im, [row1-100, col1]);
figure,imshow(im2);
title('Resized Image Using Nearest-Neighbor');



[row1, col1, ~] = size(im);
im3 = imresize(im, [row1-100, col1],'bilinear');
figure,imshow(im3);
title('Resized Image Using Bilinear');


[row1, col1, ~] = size(im);
im4 = imresize(im, [row1-100, col1],'bicubic');
figure,imshow(im4);
title('Resized Image Using Bicubic');


im(1:100,:,:)=[];
a = size(im);
figure,imshow(im);
title('Remove 100 Pixel in Row')