function [ans] = gauss(a, b)
    s_a = size(a);
    for k=1:s_a(1)
        d = a(k, k);
        b(k) = b(k)/d;
        for j=1:s_a(2)
            a(k,j) = a(k,j)/d;
        end
        for j=1:k-1
            temp = a(j,k);
            a(j,:) = a(j,:)-a(k,:)*temp;
            b(j) = b(j)-b(k)*temp;
        end
        for j=k+1:s_a(1)
            temp = a(j,k);
            a(j,:) = a(j,:)-a(k,:)*temp;
            b(j) = b(j)-b(k)*temp;
        end
    end
    ans = b;
end