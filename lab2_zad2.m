clear all;
close all;
N = 32;
L = 32;
% --------- Robimy macierz DFT
for n=1:N
    for m=1:N
        F(n,m) =  1/sqrt(N)*exp( -j*2*pi/N*(n-1)*(m-1) );
    end
end

%--------- Generuje sinusa i mnoże przez DFT
u3 = sin(2*pi*2*(0:L-1)'/L) + sin(2*pi*6*(0:L-1)'/L);
X = F*u3;
c = u3;
for n=1:N
    X_c(n) = abs(X(n));
end
figure(10)
imshow(F, []);
%--------- Sprawdzam czy F jest ortogonalna

C = F*F;
C = abs(C);
figure(50)
imshow(C, []);

%------------------- Powrot do dziedziny czasu
x2 = inv(F)*X;
x3 = ctranspose(F)*X;

error1 = max(abs(x2-u3))
error2 = max(abs(x3-u3))

%----------------- Wykres sinusa

figure(1)
plot(20*log10(abs(X)));
%pause

% ---------------Zamiana z sinusa na exp
u3 = exp(-j*(2*pi*2*(0:L-1))/L) + exp(-j*(2*pi*6*(0:L-1))/L);
X = F*u3';
figure(2)
plot(20*log10(abs(X)));
%pause


%--------------Dane z zadania 1, konkretnie u3
h = load('h.mat').h;
u3 = sin(2*pi*2*(0:L-1)'/L) + sin(2*pi*6*(0:L-1)'/L);
y = conv(u3, h);

for n=1:63              % Robimy nowe F bo y to 1:63
    for m=1:63
        F2(n,m) =  1/sqrt(63)*exp( -j*2*pi/63*(n-1)*(m-1) );
    end
end
figure(12)
imshow(F2, [])
X = F2*y';
figure(3);
stem(20*log10(abs(X)))

%--------Analiza sygnału losowego

x_r = randn(1,32)
X = F*x_r';
figure(4);
stem(20*log10(abs(X)))
%Powrot do dziedziny czasu
x_rdk = inv(F)*X;

error3 = max(abs(x_rdk'-x_r))


%hold on
%stem(u3)