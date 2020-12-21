function x = siecznych(func, a, b, iter)
    x = zeros(2, iter);
    for i=1:iter
        if func(b) - func(a) ~= 0
            x(1,i) = b - (func(b)*(b-a))/(func(b)-func(a));
        else
            x(2,1) = i-1;
            break
        end
        if abs(x(1,i)-a) < abs(x(1,i)-b)
            b = x(1,i);
        else
            a = x(1,i);
        end
    end
end