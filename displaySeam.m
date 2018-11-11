function displaySeam(im, seam, seamDirection)
size(im)
imagesc(im);
[~, n] = size(seam);
switch seamDirection
    case 'VERTICAL'
        hold on;
        for i=1:n
            x = seam(i);
            y = i;
            plot(x,y,'r-*','linewidth',0.5);
        end
        
    case 'HORIZONTAL'
        hold on;
        for i=1:n
            y = seam(i);
            x = i;
            plot(x, y, 'r-*','linewidth',0.5);
        end  
end
end