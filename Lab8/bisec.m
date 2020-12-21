function x = bisec(func, a, b, iter)
    x = zeros(1, iter);
    for i=1:iter
        x(i) = (a+b)/2;
        if func(a)*func(x(i)) < 0
            b = x(i);
        else
            a = x(i);
        end
    end
end