function energyImage = energy_image(im)
I = rgb2gray(im);
I = im2double(I);

[FX, FY] = gradient(I);
[row, col] = size(I);
energyImage = zeros(row, col);
for i=1:row
   for j=1:col
       energyImage(i, j)=sqrt(FX(i,j)^2+FY(i,j)^2);
   end
end
end