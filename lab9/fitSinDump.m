function fitness = fitSinDump( parm, x, fs, Nx )
% x – przebieg
% fs – częstotliwość prókowania
% Nx – długość sygnału
f = parm(1); 
A = parm(2); 
a = parm(3); 
z=0.01:1/fs:Nx/fs;
y = exp(-a*z)*A.*sin(2*pi*f*z);
fitness = std(y'-x); 
end
