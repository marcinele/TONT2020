clear all;
close all;

%Wczytywanie 
[X, Y] = imread("lena512.bmp");
X = double(X);
[U,S,V] = svd(X); % S - wartości osobliwe, 

%Odtwarzam obraz

X_svd = U*S*V';

L = [50, 25, 10, 5, 1];
for i=1:length(L)
    filter = zeros(size(S));
    filter(1:L(i), 1:L(i)) = 1;
    temp = U*(S.*filter)*V';
    image(temp);
    colormap(Y);
    pause;
    disp("PSNR: ");
    disp(psnr(temp, X)); 
    %measerr(X, temp);
end

% 8x8
disp("PSNR dla 8x8");
L = [5,1];
for i=1:length(L)
    X1 = X;
    for j=1:8:length(X)-7
        for k=1:8:length(X)-7
            tempX = X1(k:k+7, j:j+7);
            [tempU, tempS, tempV] = svd(tempX);
            filter = zeros(size(tempU));
            filter(1:L(i),1:L(i)) = 1;
            X1(k:k+7, j:j+7) = (tempU*(tempS.*filter)*tempV');
        end
    end
    image(X1);
    disp(psnr(X1,X));
    pause;
end

% 16x16
disp("PSNR dla 16x16");
L = [10,5, 1];
for i=1:length(L)
    X1 = X;
    for j=1:16:length(X)-15
        for k=1:16:length(X)-15
            tempX = X1(k:k+15, j:j+15);
            [tempU, tempS, tempV] = svd(tempX);
            filter = zeros(size(tempU));
            filter(1:L(i),1:L(i)) = 1;
            X1(k:k+15, j:j+15) = (tempU*(tempS.*filter)*tempV');
        end
    end
    image(X1);
    disp(psnr(X1,X));
    pause;
end

image(X1);
figure();
image(X);
colormap(Y);

