clear all;
close all;
%Wczytanie plikow
[mix1, fs1] = audioread("mix1.wav");
[mix2, fs2] = audioread("mix2.wav");

%Macierz kowariancji 
mcov = cov(mix1, mix2);

%Wektory własne 
[W, ~] = eig(mcov);
ans = W*[mix1, mix2]';
mowa = ans(1,:);
muza = ans(2,:);

%Zapisujemy wyniki
plot(mowa);
figure();
plot(muza);
figure();
plot(mix2, mix1);