function x = interp_odwr(func, a, b, iter)
    x = zeros(1,iter);
    x(1) = a;
    x(2) = (a+b)/2;
    x(3) = b;
    for i=4:iter
        f = func(x(i-1));
        f1 = func(x(i-2));
        f2 = func(x(i-3));
        if ((f-f2)*(f-f1)) == 0 || (( (f1-f2)*(f1-f) )) == 0 || (( (f2-f1)*(f2-f) )) == 0
            x = x(1:i-1);
            break;
        end
        x(i) = f2*f1/((f-f2)*(f-f1))*x(i-1) + f2*f/(( (f1-f2)*(f1-f) )) *x(i-2) + f1*f/(( (f2-f1)*(f2-f) ))*x(i-3);
    end
end