function y = lagrange(x, yk, xk)
    y = 0;
    [~, N] = size(xk);
     for k=1:N
       y = y + yk(k)*Lk(x, xk, k);
     end
end