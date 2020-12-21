% x – docolowy sygnał
% fs – częstotliwość prókowania
% Nx – długość sygnału

f = parm(1); % czêstotliwoæ sinusoidy
A = parm(2); % pocz¹tkowa amplituda
a = parm(3); % szybkoæ opadania
z=0.01:0.01:10;
y = exp(-a*z)*A.*sin(2*pi*f*z);
fitness = sum(abs(y-x)); %odchylenie