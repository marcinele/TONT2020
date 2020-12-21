clear all;
close all; 
clc; 

load h.mat

[u1, u2, u3] = values(numel(h));

U1 = toeplitz(u1);
U2 = toeplitz(u2);
U3 = toeplitz(u3);

Y1 = U1 * h';
Y2 = U2 * h';
Y3 = U3 * h';

stem(1:32, u1)
hold on
stem(1:32, Y1)
figure()
stem(1:32, u2)
hold on
stem(1:32, Y2)
figure()
stem(1:32, u3)
hold on
stem(1:32, Y3)
figure()

new_u = pinv(U2) * Y2;

% Wyniki po korekcji 
stem(1:32, u2)
hold on
stem(1:32, new_u)