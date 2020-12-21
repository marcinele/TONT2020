clear all;

x = realmin;
i = 0;

while x < realmax 
    x = 2*x;
    i = i+1;
end

disp(i+2)
disp(log2(i+2))
dec2bin(typecast(x, 'uint64'))