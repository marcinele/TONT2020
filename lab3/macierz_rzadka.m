function [A] = macierz_rzadka()
dziala = 0;
while(dziala ~= 1)
    n = 10;
    i = 1:n;
    j = 1:n;
    s1 = randi([0, 9],1,n);
    for ii=3:n-3
        i(ii) = i(ii) + randi([-2,2],1,1);
    %     i(ii) = ii;
        j(ii) = j(ii) + randi([-2,2],1,1);
    %     j(ii) = ii ;
    end
    s2 = randi([0,9],1,n);
    A1 = sparse(i,j,s1,n,n);
    A2 = sparse(1:n,1:n,s2,n,n);
    A = A1+A2;
    A = full(A);
    if det(A) ~= 0
        dziala = 1;
    end

end
end