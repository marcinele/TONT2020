function [ans] = my_lu(a,b)
    [N, M] = size(a);
    L = eye(N);
    U = zeros(N);
    for i=1:N
        for j=i:N
            U(i,j) = a(i,j);
            for k=1:(i-1)
                U(i, j) = U(i, j) - L(i,k)*U(k,j);
            end
        end
        for j=(i+1):N
            L(j,i) = a(j,i);
            for k=1:(i-1)
                L(j,i) = L(j,i) - L(j,k)*U(k,i);
            end
            L(j,i) = L(j,i)/U(i,i);
        end
    end
    
    
    
    y = zeros(1, N);
    y(1) = b(1);
    for i=2:N
        y(i) = b(i);
        for j=1:(i-1)
            y(i) = y(i) - L(i,j)*y(j);
        end
    end
    x = zeros(1,N);
    i = N-1;
    x(N) = y(N)/U(N,N);
    while(i>0)
        x(i) = y(i);
        for j=(i+1):N
            x(i) = x(i) - U(i,j)*x(j);
        end
        x(i) = x(i)/U(i,i);
        i = i-1;
    end
    ans = x;
end