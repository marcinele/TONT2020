function y = dnan(mat)
    [X,Y] = size(mat);
    for i=1:X
        for j=1:Y
            if isnan(mat(i,j))
                mat(i,j) = 0;
            end
        end
    end
    y = mat;
end