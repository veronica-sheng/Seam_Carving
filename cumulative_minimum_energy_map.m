function M = cumulative_minimum_energy_map(energyImage,seamDirection)
M = energyImage;
K = zeros(1000, 1000);
[row, col] = size(energyImage);
switch seamDirection
    case 'VERTICAL'
        for i=2:row
            for j=1:col
                switch j
                    case 1
                        M(i,j) = energyImage(i,j)+min([M(i-1,j), M(i-1,j+1)]);
                    case col
                        M(i,j) = energyImage(i,j)+min([M(i-1,j-1), M(i-1,j)]);
                    otherwise
                        M(i,j) = energyImage(i,j)+min([M(i-1,j-1), M(i-1,j), M(i-1,j+1)]);
                end
            end
        end
    case 'HORIZONTAL'
        for j=2:col
            for i=1:row
                switch i
                    case 1
                        M(i,j) = energyImage(i,j)+min([M(i,j-1), M(i+1,j-1)]);
                    case row
                        M(i,j) = energyImage(i,j)+min([M(i-1,j-1), M(i,j-1)]);
                    otherwise
                        M(i,j) = energyImage(i,j)+min([M(i-1,j-1), M(i,j-1), M(i+1,j-1)]);
                end
            end
        end
end
end