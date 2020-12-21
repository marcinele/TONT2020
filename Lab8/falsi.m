function x = falsi(func, a, b, iter)
    x = zeros(1, iter);
    for i=1:iter
        x(i) = b - (func(b)*(b-a))/(func(b)-func(a));
        if func(a)*func(x(i)) < 0
            b = x(i);
        else
            a = x(i);
        end
    end
end