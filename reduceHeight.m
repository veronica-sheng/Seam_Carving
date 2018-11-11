function [reducedColorImage,reducedEnergyImage] = reduceHeight(im, energyImage)
M = cumulative_minimum_energy_map(energyImage,'HORIZONTAL');
horizontalSeam = find_optimal_horizontal_seam(M);
[row, col, rgb] = size(im);
R = reshape(im, [row, col*rgb]);
K = zeros(row-1, col*rgb);

for i=1:col
    temp = R(:, i);
    temp(horizontalSeam(i)) = [];
    K(:,i) = temp;
end

for i=col+1:col*2
    temp = R(:, i);
    temp(horizontalSeam(i-col)) = [];
    K(:,i) = temp;
end

for i=col*2+1:col*3
    temp = R(:, i);
    temp(horizontalSeam(i-col*2)) = [];
    K(:,i) = temp;
end
reducedColorImage = uint8(reshape(K, [row-1, col, rgb]));
reducedEnergyImage = energy_image(reducedColorImage);
end