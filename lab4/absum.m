function sum = absum(mat);
    [~, N]  = size(mat);
    sum = 0;
    for i=1:N
        sum = sum + mat(i);
    end
end