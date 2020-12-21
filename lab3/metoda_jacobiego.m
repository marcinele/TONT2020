function [ans] = metoda_jacobiego(a, b)

    [N, M] = size(a);
    D = zeros(N);
    for i=1:N
        D(i,i) = a(i, i);
        a(i,i) = 0;
    end
    U = triu(a);
    L = tril(a);
    inv_D = pinv(D);
    x1 = rand(N, 1);
    x2 = rand(N, 1);
    while(max(abs(x1-x2)) > 1e-8)
        x1 = x2;
        x2 = inv_D*(b-(L+U)*x1);
    end
   
    ans = x2';
end