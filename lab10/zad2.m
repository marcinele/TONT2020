clear all;
close all;
% ---- Parametry startowe ----

T = 24;
dt = 1/1000;
t = 0.001:dt:T;
x = zeros(3, length(t));
[t,y] = ode45(@rlc, [0.001:0.001:24], x(:,1));

plot(t,y(:,1));
hold on;
plot(t,y(:,2));
figure();
plot(t,y(:,3));

x = zeros(3, length(t));
for i=2:length(x)
    d1 = dt*rlc(t(i-1), x(:,i-1));
    d2 = dt*rlc(t(i-1)+dt/2, x(:,i-1)+d1/2);
    d3 = dt*rlc(t(i-1)+dt/2, x(:,i-1)+d2/2);
    d4 = dt*rlc(t(i-1)+dt, x(:,i-1)+d3);
    
    x(:,i) = x(:,i-1) + (d1+2*d2+2*d3+d4)/(6);
end

%Następnie obliczamy resztę wyrazór
%Używając metody Geara

for i=5:length(t)
    x(:,i) = (48*x(:,i-1)-36*x(:,i-2)+16*x(:,i-3)-3*x(:,i-4)+12*dt*rlc(t(i),x(:,i)))/25;
end

figure();
plot(t, abs(y'-x));

%Odpowiedz dla Diraca
t = 0.001:dt:T;
x_dir = zeros(3,length(t));
[t,y] = ode45(@rlc_dirac, t, x_dir(:,1));
figure();
plot(t,y(:,1));
hold on;
plot(t, y(:,2));
title("Prądy dla diraca");
figure();
plot(t,y(:,3));
title("Napiecie dla Diraca");

%Odpowiedz dla skoku jednostkowego
t = 0.001:dt:T;
x_jedn = zeros(3,length(t));
[t,y] = ode45(@rlc_jedn, t, x_jedn(:,1));
figure();
plot(t,y(:,1));
hold on;
plot(t, y(:,2));
title("Prądy dla skoku jednostkowego");
figure();
plot(t,y(:,3));
title("Napiecie dla skoku jednostkowego");

%Sinusek z 3 i 5 harmoniczną 
t = 0.001:dt:100;
x_sin = zeros(3,length(t));
[t,y] = ode45(@rlc_sin, t, x_sin(:,1));
figure();
R2 = 0.5;
plot(t, y(:,2)*R2);
title("Spadek napiecia na R2");
figure();
plot(t, sin(3*t)+sin(5*t));
title("Sinus z 3 i 5 harmoniczną");


