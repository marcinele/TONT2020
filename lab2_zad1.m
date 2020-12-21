clear all; close all;

z = zeros(1, 32);
h = load('h.mat').h;

%-----------Wlatuje sygnał u1
u = [1 zeros(1, length(h)-1)];
z(1) = u(1);
u = toeplitz(u, z);
y1 = u*h';
figure(1);
stem(y1);
hold on;
stem(h) %Pierwszy zestaw danych i porownanie z h


%------------Wlatuje sygnał u2
u2 = [0, 1, 1, 0.5, 0.5, -1, -1, zeros(1, length(h)-7)]
z(1) = u2(1);
U2 = toeplitz(u2, z);
y2 = U2*h';
figure(2);
stem(y2);
hold on
stem(u2); 
pause;

%------------Dekodowanie sygnalu odebranego y2
H = toeplitz(h);
y2 = H*u2';
figure(100)
stem(y2)
u2_dk = pinv(H)*y2
figure(3);
stem(u2);
hold on
stem(u2_dk);

%------------Wlatuje sygnal u3
L = length(h);
u3 = sin(2*pi*2*(0:L-1)'/L) + sin(2*pi*6*(0:L-1)'/L);
z(1) = u3(1);
U3 = toeplitz(u3, z);
y3 = U3*h';
figure(4);
plot(y3);
hold on;
plot(u3);

%--------Sprawdzamy czy filtracja sie udala
sin_2hz = sin(2*pi*2*(0:L-1)'/L);
z(1) = sin_2hz(1);
sin_toe = toeplitz(sin_2hz, z);
y3_check = sin_toe*h';
figure(5)
plot(sin_2hz, 'r');
hold on
plot(y3_check, 'b');

