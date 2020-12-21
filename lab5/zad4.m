clear all;
close all;
data = readtable('accel_logs_2.csv');
data = table2array(data);

%Wywalamy te same czasy
[N,~] = size(data);
k = 2;
data_c(1,:) = data(1,:);
for i=2:N
    if data(i, 4) ~= data(i - 1, 4)
        data_c(k , :) = data(i, :);
        k = k + 1;
    end
end
data_c = data_c(1:k-1,:);
x = data_c(:,1);
y = data_c(:,2);
z = data_c(:,3)-9.81;
t = data_c(:,4)/1000;

vx = my_integral(x,t);
vy = my_integral(y,t);
vz = my_integral(z,t);
%Licze predkosc
v = zeros(1, length(t));
for i=1:length(t)
    v(i) = sqrt(vx(i)^2 + vy(i)^2 + vz(i)^2);
end

plot(v(1:length(v)-1));

sx = my_integral(vx,t);
sy = my_integral(vy,t);
sz = my_integral(vz,t);
sx = sx(2:5473);
sy = sy(2:5473);
sz = sz(2:5473);

figure();
plot3(sx,sy,sz);

%Calka do drogi
s = my_integral(v,t);
s = s(1:length(s)-1);
figure();
plot(s);
disp(s(length(s)));





