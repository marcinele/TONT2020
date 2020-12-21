clc;
clear all;
load('h.mat');

h=h';% Aby pomno¿yæ macierze, macierz h musi byæ kolumnowa pionowa

% Utworzenie trzech sygna³ów

u1 = zeros(32,1);
u1(1) = 1;
u2 = zeros (32,1);
u2(1:1:7) = [0,1,1,0.5,0.5,-1,-1];
disp(u2);
u3 = zeros(32,1);

u4 = zeros(32,1);
u5 = zeros(32,1);

%petla do wype³nienia 3 sygna³u
for n=0:31 
    u3(n+1)= sin(2*pi*2*n/32) + sin(2*pi*6*n/32);
end

for n=0:31 %czest 2hz 
    u4(n+1)= sin(2*pi*2*n/32);
end

for n=0:31 %czest 6hz
    u5(n+1)=sin(2*pi*6*n/32);
end

% Wektory r1,r2,r3 to pierwsze wiersze u¿yte w celu stworzenia macierzy Toeplitza

r1 = zeros(1,32);
r2 = zeros(1,32);
r3 = zeros(1,32);
r4 = zeros(1,32);
r5 = zeros(1,32);

r1(1) = u1(1);
r2(1) = u2(1);
r3(1) = u3(1);
r4(1) = u4(1);
r5(1) = u5(1);

% Generujemy macierze toeplitza dla poszczególnych sygna³ów generujemy
% swoiste sztalugi na których tworzymy t¹ macierz

%PODPUNKT_1

U1 = toeplitz(u1,r1);
U2 = toeplitz(u2,r2);
U3 = toeplitz(u3,r3);
U4 = toeplitz(u4,r4);
U5 = toeplitz(u5,r5);

y1=U1*h;

if (y1 == h)
    disp('y takie samo jak h');
else
    disp('y ró¿ne od h');
end

%PODPUNKT_2

y2=U2*h;

P=pinv(h),
P=toeplitz(P);
u=P*y2;

figure(1);
subplot(2,1,1);
hold on;
stem(u2, 'filled','b');
plot(y2,'r');
title('Sygna³ nadany i odebrany');
subplot(2,1,2);
hold on;
plot(u,'r');
title('Sygna³ odebrany po korekcji');

%PODPUNKT_3

y3=U3*h;

y4 = U4*h; 
y5 = U5*h;

figure(4);
title('Sygna³ nadany i odebrany 2 hz');
subplot(2,1,1);
hold on;
plot(u4, 'b');
subplot(2,1,2);
hold on;
plot(y4,'r');

figure(5);
title('Sygna³ nadany i odebrany 6 hz');
subplot(2,1,1);
hold on;
plot(u5, 'b');
subplot(2,1,2);
hold on;
plot(y5,'r');



figure(3);
title('Sygna³ nadany i odebrany');
subplot(2,1,1);
hold on;
plot(u3, 'b');
subplot(2,1,2);
hold on;
plot(y3,'r');

figure(10);
hold on;
freqz(u3);

figure(11);
hold on;
freqz(y3);

figure(12);
hold on;
freqz(h);

figure(13);
hold on;
freqz(u3,y3);