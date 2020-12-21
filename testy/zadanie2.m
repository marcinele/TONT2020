clc;
clear all;
load('h.mat');
N=32;

%obliczenie na funkcji trygonometrycznej

x = zeros(32,1);
for i=0:31 
    x(i+1)= sin(2*pi*2*i/32) + sin(2*pi*6*i/32);
end

for n=0:31
    for m=0:31
        F(n+1,m+1)=(1/sqrt(N))*cos(2*(pi/N)*n*m)-j*(1/sqrt(N))*sin(2*(pi/N)*n*m);
    end
end

FF = F*F';
figure(2)
imshow(FF,[]),

X=F*x;
figure(1)
X_s=20*log(abs(X)); %widmo gêstoœci mocy w skali decybelowej
plot(X_s);

x1=inv(F)*X;
x2=(F.')*X;

if (x1==x2)
    disp('Macierze x1 i x2 s± takie same.');
else
    disp('Macierze x1 i x2 nie s± takie same.');
end
% Obliczanie na exp
N=32
for n=0:31
    for m=0:31
        F(n+1,m+1)=exp(-j*2*pi*n*m/N)*(1/sqrt(N));
    end
end
disp('Macierz ortogonalna?');

FE=F*F';
figure(5)
imshow(FE,[]),


x_e = zeros(32,1);
for i=0:31 
    x_e(i+1)= exp(-i*2*pi*2*i/32) + exp(-i*2*pi*6*i/32);
end

X_e=F*x_e;
figure(10)
X_eshow=20*log(abs(X_e));
plot(X_eshow);
title('Widmo gêsto¶ci mocy');

x_e1=inv(FF)*X;
x_e2=(FF.')*X;
if (x_e1==x_e2)
    disp('Macierze x_e1 i x_e s± takie same.');
else
    disp('Macierze x_e1 i x_e nie s± takie same.');
end

%Warning: Matrix is close to singular or badly scaled. Results may be inaccurate. RCOND =  2.658234e-18. 
 
%Warning: Matrix is close to singular or badly scaled. Results may be inaccurate. RCOND =  3.437546e-18.

%  conv()

for n=0:62
    for m=0:62
        Fy(n+1,m+1)=(1/sqrt(N))*cos(2*(pi/N)*n*m)-i*(1/sqrt(N))*sin(2*(pi/N)*n*m);
    end
end

for n=0:62
    for m=0:62
        Fy_e(n+1,m+1)=(1/sqrt(N))*exp(-i*2*(pi/N)*n*m);
    end
end

y=conv(h,x);

Y=Fy*y;
%y1=inv(Fy)*Y;
%y2=(F.')*Y;
%if (y1==y2)
%    disp('Macierze y1 i y s± takie same');
%else
%    disp('Macierze y1 i y nie s± takie same');
%end

%rand
rs = randn(32,1);
RS=F*rs;
rs1=inv(F)*RS;
rs2=inv(F.')*RS;


figure(20)
RS_eshow=20*log(abs(RS));
plot(RS_eshow);
title('Widmo gêsto¶ci mocy');