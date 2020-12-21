clear all;
close all;
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
v = zeros(1,N-1);
for i=3:N-3
    v(i) = (d(i-2)-8*d(i-1)+8*d(i+1)-d(i+2))/(12*(pozycje(i-1,1)-pozycje(i-2,1)));
end
 plot(pozycje(2:end,1),v);

  