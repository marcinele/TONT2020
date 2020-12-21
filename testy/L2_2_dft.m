% Lab2_2: Macierze - DFT: Analiza czêstotliwoœciowa

clear all; close all;

N = 500;

fpr = 8000;
dt = 1/fpr;
t = dt*(0:N-1);

T = N*dt;
f0 = 1/T,
k1=4; k2=50; f1=k1*f0, f2=k2*f0,
x1 = 10 * sin( 2*pi* f1 *t );
x2 = 50 * sin( 2*pi* f2 *t );
x = x1 + x2;

    figure; plot(x); grid; xlabel('n'); title('x(n)'); pause
    figure; plot(t,x); grid; xlabel('t'); title('x(t)'); pause

% Macierz analizy
f=f0*(0:N-1);
for k=1:N
    A(k,1:N) = exp(-j*2*pi*(k-1)*f0*t) / sqrt(N);
  % A(k,1:N) = exp(-j*2*pi*(k-1)*f0*t) / (N/2);
end
disp('Macierz ortogonalna?');
AA =A*A';
real(AA(1:5,1:5)), pause

% Analiza
X = A * x.';
    figure; stem(0:N-1,abs(X)); grid; xlabel('numer k'); ylabel('Modul'); title('Widmo |X(k)|'); pause
    figure; stem(f,abs(X)); grid; xlabel('f [Hz]'); ylabel('Modul'); title('Widmo |X(f)|'); pause

% Przetwarzanie
if(1)
   X(k2+1) = 0; X(end-k2+1) = 0;
   figure; stem(0:N-1,abs(X)); grid; xlabel('numer k'); ylabel('Modul'); title('Widmo |X(k)|'); pause
end

% Synteza
%xe = inv(A)*X;
 xe = A'*X;
%xe = real( (N/4) * A'*X );


error_x_xe = max(abs(x-xe')),
error_x1_xe = max(abs(x1-xe')), pause

    figure; plot(1:N,real(x),'r-',1:N,real(xe),'b-'); grid; xlabel('n'); title('x(n)'); pause
    figure; plot(1:N,real(x1),'r-',1:N,real(xe),'b-'); grid; xlabel('n'); title('x(n)'); pause

