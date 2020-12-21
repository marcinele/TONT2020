close all;
clear all;

%Zaladowanie danych
load('pozycje.txt');
[N,~] = size(pozycje);
pozycje(:,1) = pozycje(:,1)./1000;
pozycje(:,2) = pozycje(:,2).*pi/180;
pozycje(:,3) = pozycje(:,3).*pi/180;
d = zeros(1,N-1);

R = 6371000;

%Obliczanie dystansu
for i = 2:N
    a = sin((pozycje(i,2)-pozycje(i-1,2))/2)^2+cos(pozycje(i,2))*cos(pozycje(i-1,2))*sin((pozycje(i,3)-pozycje(i-1,3))/2)^2;
    c = 2*atan2(sqrt(a), sqrt(1-a));
    d(i-1) = sqrt((R*c)^2+(pozycje(i,4)-pozycje(i-1,4))^2);
end

%Obliczanie prędkości
v = zeros(1,N-1);
for i=2:N
    v(i-1) = d(i-1)/(pozycje(i,1)-pozycje(i-1,1));
end

v2 = d./diff(pozycje(:,1)');
disp(max(abs(v2-v)));

subplot(211); 
plot(pozycje(2:end,1),v);
title("Prędkość");
hold on;


%Obliczanie przyspieszenia
a = zeros(1,N-2);
for i=2:N-1
    a(i-1) = (v(i)-v(i-1))/(pozycje(i,1)-pozycje(i-1,1));
end
a2 = diff(v2)./diff(pozycje(1:125,1)');
a2 = a2(1:124);
disp(max(abs(a-a2)));


subplot(212); 
plot(pozycje(3:end,1),a, 'r');
title("Przyspieszenie");
hold on;

z = 0;
p = 0;
t_z = zeros(1,43);
t_p = zeros(1,44);
t1 = 1;
t2 = 1;
for i=2:length(a)
    if a(i) <= 0 && a(i-1) >= 0
        disp("Czas: " + pozycje(i+2,1) + " - przyspieszenie");
        z = z + 1;
        t_z(t1)=pozycje(i+2,1);
        t1 = t1 + 1;
    elseif a(i) >= 0 && a(i-1) <= 0
        p = p+1;
        t_p(t2) = pozycje(i+2,1);
        t2 = t2 + 1;
        disp("Czas: " + pozycje(i+2,1) + " - zwolnienie");
    end
end
plot(t_z, zeros(1,43), 'go');
plot(t_p, zeros(1,44), 'bo');
disp("Liczba zwolnień: " + z );
disp("Liczba przyspieszeń: " + p);