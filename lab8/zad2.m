clear all; close all;
%Obliczanie pierwiastka

global A % No jakaś liczba do wyliczenia pierwiastka z niej
A = 8;

iter = 10000;
sqrt_A = newton_raphson(@fun1, @fun1_p, 0, A, iter);
sqrt_A = sqrt_A(iter);
disp("Pierwiastek z " + A + ": " + sqrt_A);

%Obliczanie odwrotności
A2 = 2; %Liczba której odwrotność obliczamy

x = A2;
for i=1:iter
    x = x - (A2*x-1)/(A2);
end

disp("Odwrotność A2: " + x);

