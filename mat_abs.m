function [res] = mat_abs(x)
    for i=1:length(x)
        res(i) = abs(x(i));
    end
end