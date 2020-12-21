clear all;
close all;

% ---- Parametry startowe ----

T = 24;
dt = 1/1000;
t = 0.001:dt:T;

%Obliczamy kilka początkowych wartości
%Jakimś algorytmem samostartującym
%Np. Rungego-Kutty

x = zeros(3, length(t));
for i=2:4
    d1 = dt*rlc(x(:,i-1), t(i-1));
    d2 = dt*rlc(x(:,i-1)+d1/2, t(i-1)+dt/2);
    d3 = dt*rlc(x(:,i-1)+d2/2, t(i-1)+dt/2);
    d4 = dt*rlc(x(:,i-1)+d3, t(i-1)+dt);
    
    x(:,i) = x(:,i-1) + (d1+2*d2+2*d3+d4)/(6);
end

%Następnie obliczamy resztę wyrazór
%Używając metody Geara

for i=5:length(t)
    x(:,i) = (48*x(:,i-1)-36*x(:,i-2)+16*x(:,i-3)-3*x(:,i-4)+12*dt*rlc(x(:,i-1), t(i-1)))/25;
end

plot(t, x(1,:));
hold on;
plot(t, x(2,:));
title("i1 i i2")
figure();
plot(t, x(3,:));
title("uc");
