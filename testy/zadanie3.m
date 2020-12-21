clc;
clear all;
d=ones(1,1024);
for i=10:1024
    d(i)=xor(d(i-4),d(i-9)); %wiadomoœci z bramek logicznych
end

%y = xcorr( d, 'biased');
%figure(2);
%plot( y ); 

x = xcorr(d,d,'unbiased');
figure(1);
plot(x);



% Sekwencja posiada 511 bitów, ijest symetryczna wzglêdem x = 1024
% wynosi to 511 i powtarza siê dwa razy
% 511 bo 1024-513