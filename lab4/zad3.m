clear all;
close all;

%Wczytanie i przesuniecie
t=pi/6;
rot_mtx=[cos(t), -sin(t); sin(t), cos(t)];
T=[50;-20];
in = imread( 'checkerBoard_20_200.png' );
in = double( rgb2gray( in ) );
N = size( in, 1 );
[X,Y]=meshgrid( 1:N );
XY=[ reshape(X,1,N*N); reshape(Y,1,N*N) ];
XYr=rot_mtx*(XY+repmat(T,1,N*N));
Xi=reshape(XYr(1,:),N,N);
Yi=reshape(XYr(2,:),N,N);

out = zeros(200);

%Interpolacja zerowego stopnia 

for i=1:200
    for j=1:200
        if round(Xi(i,j)) <= 200 && round(Xi(i,j)) > 0 && round(Yi(i,j)) <= 200 && round(Yi(i,j)) > 0
            out(i,j) = in(round(Xi(i,j)), round(Yi(i,j)));
        else
            out(i,j) = 0;
        end
    end
end

imshow(out, []);

%interpolacja biliniowa
out2 = zeros(200);

Q11 = 0; Q21 = 0; Q12 = 0;  Q22 = 0;

for i=1:200
    for j=1:200
        x1 = floor(Xi(i,j));
        x2 = ceil(Xi(i,j));
        y1 = floor(Yi(i,j));
        y2 = ceil(Yi(i,j));
        x = Xi(i,j);
        y = Yi(i,j);
        if floor(Xi(i,j)) > 0 && floor(Xi(i,j)) <= 200 && ceil(Xi(i,j)) > 0 && ceil(Xi(i,j)) <= 200 && floor(Yi(i,j)) > 0 && floor(Yi(i,j)) <= 200 && ceil(Yi(i,j)) > 0 && ceil(Yi(i,j)) <= 200
            Q11 = in(x1, y1)*(x2-x)*(y2-y);
            Q21 = in(x2, y1)*(x-x1)*(y2-y);
            Q12 = in(x1, y2)*(x2-x)*(y-y1);
            Q22 = in(x2, y2)*(x-x1)*(y-y1);
            out2(i,j) = (Q11+Q21+Q12+Q22)/((x2-x1)*(y2-y1));
        else
            out2(i,j) = 0;
        end
    end
end


figure(3);
imshow(out2, []);

%Funkcjami Matlabowymi
out1_m = interp2(X, Y, in, Xi, Yi, 'nearest'); 
out2_m = interp2(X, Y, in, Xi, Yi, 'linear');
out1_m = dnan(out1_m);
out2_m = dnan(out2_m);

figure(4);
imshow(out1_m, []);
figure(5);
imshow(out2_m, []);

error1 = absum(abs(out-out1_m))
error2 = absum(abs(out2-out2_m))

