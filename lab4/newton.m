function y = newton(x, xk, d)
    [~, N] = size(xk);
    y = d(1,1);
    for k=1:N-1
        temp = 1;
        for j=1:k
            temp = temp*(x - xk(j));
        end
        y = y + d(k+1, k+1)*temp;
    end
end