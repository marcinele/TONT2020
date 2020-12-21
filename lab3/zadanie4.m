close all;
clear all;
%Odczytanie pliku
[x, fpr] = audioread('A.wav');
fpr
figure(1);
plot(x); %soundsc(x, fpr);

%Wyznaczenie K współczynników funkcji autokorelacji

r = zeros(128);
for k=1:128
    for n=k+1:3*fpr
        r(k) = r(k) + x(n)*x(n-k);
    end
end

%Rysujemy r(k)
figure(2);
plot(r);

%Kontruujemy macierz R i wektor r

P = 10;
r2 = r(1:P)
R = toeplitz(r2);
r = r(2:P+1);
size(R)
size(r)
a = -R\r';

% Syntezujemy próbki sygnału
y = zeros(1,3*fpr);
T = 68;
e = zeros(1,3*fpr);
i = 68;
while i < 3*fpr
    e(i) = 1;
    i = i + 68;
end
for n=1:3*fpr
    y(n) = e(n);
    k = 1;
    while(k <= 10 && k < n)
        y(n) = y(n) - a(k)*y(n-k);
        k = k+1;
    end
end

figure(3);
plot(y); soundsc(y, fpr);