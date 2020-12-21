clear all;
close all;
% ---- Parametry startowe ----

T = 24;
dt = 1/1000;
t = 0.001:dt:T;
x = zeros(3, length(t));
[t,y] = ode45(@rlc, [0.001:0.001:24], x(:,1));

plot(t,y);