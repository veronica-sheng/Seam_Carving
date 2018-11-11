function [reducedColorImage,reducedEnergyImage] = reduceWidth(im, energyImage)
M = cumulative_minimum_energy_map(energyImage,'VERTICAL');
verticalSeam = find_optimal_vertical_seam(M);
[row, col, rgb] = size(im);
R = reshape(im, [row, col*rgb]);
K = zeros(row, (col-1)*rgb);

for i=1:row
    temp = R(i, :);
    temp(verticalSeam(i)) = [];
    temp(verticalSeam(i)+col-1) = [];
    temp(verticalSeam(i)+col*2-2) = [];
    K(i,:) = temp;
end
reducedColorImage = uint8(reshape(K, [row, col-1, rgb]));
reducedEnergyImage = energy_image(reducedColorImage);

end