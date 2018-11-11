function horizontalSeam = find_optimal_horizontal_seam(M)
[row, col] = size(M);
e = M(:, col);
[~, I] = min(e);
horizontalSeam(col) = I;
for c=col-1:-1:1
    switch I
        case 1
            [~, temp] = min([M(I,c), M(I+1,c)]);
            switch temp
                case 1
                    horizontalSeam(c) = I;
                case 2
                    horizontalSeam(c) = I+1;
            end
        case row
            [~, temp] = min([M(I-1,c), M(I,c)]);
            switch temp
                case 1
                    horizontalSeam(c) = I-1;
                case 2
                    horizontalSeam(c) = I;
            end
        otherwise
            [~, temp] = min([M(I-1,c), M(I,c), M(I+1,c)]);
            switch temp
                case 1
                    horizontalSeam(c) = I-1;
                case 2
                    horizontalSeam(c) = I;
                case 3
                    horizontalSeam(c) = I+1;
            end
    end
    I = horizontalSeam(c);
end
end