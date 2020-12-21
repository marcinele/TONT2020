close all;
clear all;

N = 1024;
dn = zeros(1,1024);

for i=1:1024
    if(i<10)
        dn(i) = 1;
    else
        dn(i) = xor(dn(i-4),dn(i-9));
    end
end

p = xcorr(dn);
plot(p)