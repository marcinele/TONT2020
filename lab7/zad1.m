clear all;
close all;


%Metoda QR
A=magic(4);
A(1,3) = 99;
[Q,R]=qr(A);
for i=1:100
[Q,R]=qr(R*Q);
end
lambda=diag(R*Q)


%Obliczanie największej wartości własnej - metoda potęgowa
[N, ~] = size(A);
x = ones(N,1);
for i=1:20
y=A*x;
[ym,i]=max(abs(y));
x=y/y(i);
l=y(i);
end

disp("Największa wartość własna: "); disp(l);

disp("Wektor wlasny jej odpowiadający: "); disp(x);
