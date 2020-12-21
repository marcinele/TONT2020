% Lab2_2: DFT

clear all; close all;

% X = A * x  <---  w wiersach macierzy A s¹ wzorce oscylacji 

N = 20; dt = 1;
t = dt*(0:N-1);
T = N*dt; f0=1/T;

x = cos(2*pi*(3*f0)*t); % sygna³ 
x = x.';
plot(t,x); pause

for k=1:N
   A(k,:) = exp(j*2*pi/N*(k-1)*(0:N-1))/sqrt(N); % macierz wzorców czêstotliwoœci
end
% A1 = exp( j*2*pi/N* ((0:N-1)'*(0:N-1)) )/sqrt(N); max(max(abs(A-A1))), pause % to samo inaczej

X = A * x;    % sygna³ --> widmo
stem(abs(X)); pause

xest = A'*X;  % widmo --> sygna³
error = max(abs( x - xest)), pause