function x = newton_raphson(func, func_p, a, b, iter)
    x = zeros(1,iter);
    x(1) = (a+b)/2;
    for i=2:iter
        x(i) = x(i-1) - func(x(i-1))/func_p(x(i-1));
    end
end