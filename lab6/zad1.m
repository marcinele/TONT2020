clear all;
close all;

%Wczytujemy dane
D = readtable("LoudnessWarNumbers.csv")
D = table2array(D);
%Porządkujemy dane
[N,~] = size(D);
x = D(:,1);
x_u = unique(x);
%x_u = sort(x_u);
y1 = D(:,2);
y2 = D(:,3);
y3 = D(:,4);

%Dla sredniej
[a1, b1] = reglinp(x, y1);
plot(x,y1,'r.');
title("Dla sredniej");
hold on;
plot(x_u, a1*x_u + b1, 'b');
disp( (x_u(1)*a1-x_u(length(x_u))*a1)/(x_u(length(x_u))-x_u(1)) )

%Dla min

[a2, b2] = reglinp(x, y2);
figure(2);
plot(x,y2,'r.');
title("Dla min");
hold on;
plot(x_u, a2*x_u + b2, 'b');
disp( (x_u(1)*a2-x_u(length(x_u))*a2)/(x_u(length(x_u))-x_u(1))  )

%Dla max
[a3, b3] = reglinp(x, y3);
figure(3);
plot(x,y2,'r.');
title("Dla max");
hold on;
plot(x_u, a3*x_u + b3, 'b');
disp( (x_u(1)*a3-x_u(length(x_u))*a3)/(x_u(length(x_u))-x_u(1)) )