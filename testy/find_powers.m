function v = find_powers(n)
    num = 0; 
    v = [];
    i = 1;
    while num<n
        num = 2^i;
        v = [v num];
        i = i+1;
    end
end