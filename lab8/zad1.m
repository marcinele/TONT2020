clear all; close all;
iter = 10;
%Metoda bisekcji
x = bisec(@sin, 1, 5, iter);
disp("Metodą bisekcji: " + x(iter));

%Reguła falsi
x_falsi = falsi(@sin, 1, 5, iter);
disp("Metodą falsi: " + x_falsi(iter));

%Metoda siecznych
x_s = siecznych(@sin, 1, 5, iter);
disp("Metodą siecznych: " + x_s(1,x_s(2,1)));

%Metoda Newtona-Raphsona
x_NR = newton_raphson(@sin, @cos, 1, 5, iter);
disp("Metodą Newtona-Raphsona: " + x_NR(iter)); 

iter_p = 1:iter;
figure();
hold on;
subplot(2,2,1);
plot(iter_p, abs(x-pi), 'r');
title("Metoda bisekcji");
subplot(2,2,2);
plot(iter_p, abs(x_falsi-pi), 'g');
title("Metoda falsi");
subplot(2,2,3);
plot(iter_p(1:x_s(2,1)), abs(x_s(1,1:x_s(2,1))-pi), 'b');
title("Metoda siecznych")
subplot(2,2,4);
plot(iter_p, abs(x_NR-pi), 'black');
title("Metoda Newtona-Raphsona");
%Interpolacja odwrotna

x_interp = interp_odwr(@sin, 1, 5, iter);
disp("Metodą interpolacji odwrotnej: " + x_interp(length(x_interp)));
figure(2);
plot((1:length(x_interp)), x_interp);
title("Interpolacja odwrotna");