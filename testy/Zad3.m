close all;
clear all;
clc;
N = 1024;
d = zeros(1, N);
for n = 1:N
    if n < 10
        d(n) = 1;
    else
        d(n) = xor(d(n-4), d(n-9));
    end    
end
p = xcorr(d);
plot(p) %512 bit 