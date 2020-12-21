clear all;
close all;
optimset('MaxFunEvals', 1e30); %MaxFunEvals - Maximum number of function evaluations allowed. (opcja do fminsearch
load lab_10_2.mat;
in = in_all(:,5);
%initial_f = 1;
initial_A = 1;
initial_a = 1;
fs = 100;
Nx = length(in);
%Optymalizacja z transformata, a co!

t = fft(in);
F = fs*(1:(Nx/2))/Nx;
figure(2);
plot(F, abs(t(1:500)));

[~, index] = max(abs(t(1:500)));
initial_f = F(index);

% estymacja parametrów
initParm = [ initial_f, initial_A, initial_a ]; % parametry poczatkowe
outParm = fminsearch( @(x) fitSinDump(x, in, fs, Nx) , initParm );
estimated_f = outParm(1);
estimated_A = outParm(2);
estimated_a = outParm(3);
x=0.01:1/fs:Nx/fs;
y1 = exp(-estimated_a*x)*estimated_A.*sin(2*pi*estimated_f*x);

figure(1);
hold on
subplot(2,1,1); plot(x, y1, 'b');
subplot(2,1,2); plot(x, in, 'r');

max(std(y1'-in))

