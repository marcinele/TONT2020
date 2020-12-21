
% WL 2 splot = przej�cie danych przez liniowy kana� transmisyjny
clear all; close all;

% Identyfikacja kana�u za pomoc� piota

h = load('h.mat').h;   
u = [1 zeros(1, length(h)-1)] % ones(1,10);   % dane transmitowane - teraz pilot znany odbiornikowi
        % wagi kana�u transmisji

% -------------------------
% Transmisja #1
y1 = conv(u,h), pause           % przej�cie danych przez kana� - wersja #1
stem(y1); pause

% -------------------------
% Macierz kana�u
Lu=length(u);
Lh=length(h);
U = zeros(Lu,Lh);
for i=Lh:Lu
    U(i,1:Lh) = u(i : -1 : i-(Lh-1));
end
U, pause
for i=1:Lh-1
    U(i,1:i) = u(i:-1:1);
end
sizeU = size(U),
U, pause

% U = toeplitz( u, [ u(1) zeros(1,Lh-1) ] ), pause % to samo szybciej

% -------------------------
% Transmisja #2
y2 = U*h';               % przej�cie danych przez kana� - wersja #2
stem(y2); pause

error_z_conv=max(abs( y1(1:Lu) - y2(1:Lu).' ))

% -------------------------
% Identyfikacja kana�u
hest = pinv(U)*y2, pause % je�li znamy U i y2, to mo�emy odtworzy� h (zidentyfikowa� kana�)
% -------------------------

% Teraz przesy�amy dane, kt�rych nie znamy (ale ju� wiemy co robi kana�)

u = rand(Lu,1);

%hest = hest';  % TO!
 hest = h;      % Tylko test
 
c = [ hest(1:Lh) zeros(1,Lu-Lh) ];
r = [ hest(1) zeros(1,Lu-Lh) hest(Lh:-1:2) ];
H = toeplitz(c,r), pause
    if(1) % r�cznie
        H = zeros(Lu,Lu);
        for i=1:Lh-1
            H( i,i:-1:1 ) = hest(1:i);
            H( i,Lu:-1:Lu-(Lh-i-1) ) = hest(i+1:Lh);
        end    
        for i=Lh:Lu
            H( i, i-(Lh-1):i ) = hest(Lh:-1:1);
        end
        H, pause
    end

y = H*u;              % Transmisja
uest = inv(H) * y;    % Korekcja

disp('nadane | odtworzone')
[ u, uest ], pause % nadane i odtworzone
