function y = newton_pochodna(x, xk, d)
    [~, N] = size(xk);
    y = d(1,1);
    for k=1:N-1
        m = 1;
        s = 0;
        for k2=1:k
            for j=1:k
                if j ~= k2
                    m = m*(x-xk(j));
                end
            end
            s = s+m;
            m = 1;
        end
        
        y = y + d(k+1, k+1)*s;
    end
end