function verticalSeam = find_optimal_vertical_seam(M)
[row, col] = size(M);
e = M(row, :);
[~, I] = min(e);
verticalSeam(row) = I;
for r=row-1:-1:1
    switch I
        case 1
            [~, temp] = min([M(r,I), M(r,I+1)]);
            switch temp
                case 1
                    verticalSeam(r) = I;
                case 2
                    verticalSeam(r) = I+1;
            end
        case col
            [~, temp] = min([M(r,I-1), M(r,I)]);
            switch temp
                case 1
                    verticalSeam(r) = I-1;
                case 2
                    verticalSeam(r) = I;
            end
        otherwise
            [~, temp] = min([M(r,I-1), M(r,I), M(r,I+1)]);
            switch temp
                case 1
                    verticalSeam(r) = I-1;
                case 2
                    verticalSeam(r) = I;
                case 3
                    verticalSeam(r) = I+1;
            end
    end
    I = verticalSeam(r);
end
end