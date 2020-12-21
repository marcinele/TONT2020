% lab02 - macierze
% Kwant 2013.09.04

clear all;
close all;

h = fir1( 31, 0.2 );
save h h;
figure, freqz( h );
H = toeplitz( h );

x1 = zeros( size(h') );
x1(1) = 1;

y1 = H*x1;
figure, plot( 1:length(h), h, 'b', 1:length(y1), y1, 'rx' );

x2 = zeros( size(h') );
x2( 2:3 ) = 1;
x2( 4:5 ) = 0.5;
x2( 6:7 ) = -1;

y2 = H*x2;
figure, plot( 1:length(x2), x2, 'b.', 1:length(y2), y2, 'r' );

x3 = sin( (0:31)'/32*2*pi * 2 ) + sin( (0:31)'/32*2*pi * 6 );
y3 = H*x3;

figure, plot( 1:length(x3), x3, 'b', 1:length(y3), y3, 'r' );

