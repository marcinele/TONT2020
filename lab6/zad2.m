clear all;
close all;
load sndb_prbs.mat;

M=30; % długość licznika
y = y + 0.1*randn(size(y)) ;   % dodawanie szumu
l=[50, 100, 200, 1000];
col = ["r", "g", "b", "black"];
hold all;
                              % maksymalna długość sygnału do analizy                              
for i=1:length(l)
    L=l(i);       % dla kolejnych długości sygnału, IM WIEKSZE L TYM DOKLADNIEJSZY FILTR
    U=[];
    for j=1:M           % metoda parametryczna model FIR o długości M
        U=[U, u(M-j+1:L-j+1)];
    end
    Y=y(M:L);
    b=U\Y;
    Hls=freqz(b(1:M),1, round(L/2));
    ids=1:L/2;
    Freqs=(ids-1)*fs/L;
    subplot(1,1,1);
    plot( Freqs', 20*log10(abs(Hls)), col(i) );
end

%Druga metoda
H = fft (filter (y, 1, u)) ./ fft (filter (u, 1, u));

hold off;
figure();
temp = [1:32767/2];
fre = temp.*fs/(32767);
plot(fre,20*log10(abs(H(1:length(H)/2))),'black')

