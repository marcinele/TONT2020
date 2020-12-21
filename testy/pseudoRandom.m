% lab02 - pseudo random
% Kwant 2013.09.05

clear all;
close all;

N = 1024;
b = zeros( N, 1 );
b( 1:9 ) = 1;
for i =10:length(b)
    b(i) = xor( b(i-4), b(i-9) );
end

cb = xcorr( b, b );
figure, plot( cb ); title( 'biased' );

cb1 = xcorr( b, b, 'unbiased' );
figure, plot( cb1 ); title( 'unbiased' );

