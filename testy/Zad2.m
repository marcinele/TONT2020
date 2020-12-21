format long
close all;
clear all;
clc;
load Y3.mat
N = 32;
F = zeros(N, N);
for n = 1:N
    for m=1:N
        F(n,m) = 1/sqrt(N) * exp(-j*2*pi/N*(n-1)*(m-1));
    end
end
[~, ~, x] = values(N);
X = F * x';
X_c = zeros(N);
for n = 1:N
    X_c(n) = abs(X(n));
end
x1 = inv(F) * X;
x2 = transpose(ctranspose(F)) * X;
x3 = ctranspose(F) * X;

stem(1:32, X_c)
figure()
for n = 1:N
    X_c(n) = abs(x1(n));
end
stem(1:32, X_c)
figure()
for n = 1:N
    X_c(n) = abs(x2(n));
end
stem(1:32, X_c)
figure()
for n = 1:N
    X_c(n) = abs(x3(n));
end
stem(1:32, X_c)
figure()

u4 = zeros(1, N);
for n = 1:N
    u4(n) = exp(-j*(2*pi*2*(n-1))/N) + exp(-j*(2*pi*6*(n-1))/N); 
end
X1 = F * u4';
for n = 1:N
    X_c(n) = abs(X1(n));
end
stem(X_c)
figure()

X2 = F * Y3;
for n = 1:N
    X_c(n) = abs(X2(n));
end
stem(X_c)

Xk = randn(1, 32)
