clear all;
close all;
%Przygotowanie

x = 0:(2*pi)/100:2*pi;
y1 = sin(x); y2 = cos(x);

[~, N] = size(x);

wstecz = zeros(1,N);
centralnie = zeros(1,N);

wstecz = wst(y1,x,N);

centralnie = cnt(y1,x,N);

plot(wstecz(2:N));
hold on;
plot(centralnie(2:N-1));
hold on;
plot(y2);

%Dodajemy szumy
y1_c = y1;
y1 = add_awgn_noise(y1_c, 20);
wst2 = wst(y1, x, N);
cnt2 = cnt(y1,x,N);
figure();
plot(wst2);
hold on;
plot(cnt2);


y1 = add_awgn_noise(y1_c, 35);
wst2 = wst(y1, x, N);
cnt2 = cnt(y1,x,N);
figure();
plot(wst2);
hold on;
plot(cnt2);

y1 = add_awgn_noise(y1_c, 50);
wst2 = wst(y1, x, N);
cnt2 = cnt(y1,x,N);
figure();
plot(wst2);
hold on;
plot(cnt2);