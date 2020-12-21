% lab02 - dft
% Kwant 2013.09.04

clear all;
close all;

x3 = sin( (0:31)'/32*2*pi * 2 ) + cos( (0:31)'/32*2*pi * 6 );

F = dftmtx( 32 );

Y3 = F*x3;

figure, plot( 20*log10( abs(Y3) ) );
