clear all; close all;
%Wczytywanie danych

load('X.mat');
x = X(:,1);
y = X(:,2);
z = X(:,3);

%Plotowanie punktów

plot3(x, y, z);

%Interpolacja linear

[Xq, Yq] = meshgrid((-5:0.1:15),(-10:0.1:10));
I_l = griddata(x, y, z, Xq, Yq, 'cubic');
surf(I_l);