clear all; close all;

%Uzupełnienie danych
xk = [5 6 8 11];
yk = [1 2 7 15];

%Przygotowanie x i y
x = 5:0.1:11;
y_l = zeros(size(x));

%Obliczanie y z Lagrange'a
[~, N] = size(xk);
[~, STOP] = size(x);
for i=1:STOP
    y_l(i) = lagrange(x(i), yk, xk);
end

%Wyplotowanie tego
plot(x,y_l, 'b');
figure();

%Obliczanie y metodą Newtona
d(:,1) = yk;
for j=2:N
    for k=j:N
        d(k,j)=( d(k,j-1)-d(k-1,j-1) )/( xk(k)-xk(k-j+1) );
    end
end

y_n = zeros(size(x));
for i=1:STOP
   y_n(i) = newton(x(i), xk, d);
end

plot(x, y_n, 'r');

%Temperatura o 7:15
disp(lagrange(7.25, yk, xk));

%Kiedy przekroczy 3 stopnie?
x_k3 = yk;
y_k3 = xk;
x_3 = 1:0.1:15;
[~, N] = size(x_k3);
[~, STOP] = size(x_3);
y_3l = zeros(size(x));
for i=1:STOP
    y_3l(i) = lagrange(x_3(i), y_k3, x_k3);
end
figure(2);
plot(x_3, y_3l);
disp(lagrange(3, y_k3, x_k3))
