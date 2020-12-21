close all
clear all
i1=imread('Krata1.jpg');
i1g=double(rgb2gray(i1));
[sx, sy]=size(i1g);
cx=sx/2; cy=sy/2;


% wyszukanie przecięć linii
wzorzec=[0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0];
ic=normxcorr2(wzorzec,i1g);
ig=ic<-0.7;
ig=bwmorph(ig,'shrink',Inf);

[ix,iy]=find(ig>0); % współrzędne przecięć linii
figure();
plot(ix, iy)
title("Punkt przed prostowaniem");
r=sqrt((ix-cx).^2+(iy-cy).^2); % promień do środka obrazu
[rs,i]=sort(r);

x_p = ix(1:14);
y_p = iy(1:14);
[a,b] = reglinp(x_p, y_p);
y_n = x_p.*a +b;
avg = mean(abs(y_p-y_n))

% ustalenie punktów odniesienia (siatki regularnej)
x0=ix(i(1)); y0=iy(i(1));
dx=abs(ix(i(1))-ix(i(4)))-1;
dy=abs(iy(i(1))-iy(i(4)))-3;
jx=x0+dx*[-4:1:5];
jy=y0+dy*[-6:1:7];
[jX, jY]=meshgrid(jx,jy);
jx=jX'; jx=jx(:); % współrzędne przecięć linii dla obrazu wzorcowego
jy=jY'; jy=jy(:);
rm=sqrt((jx-cx).^2+(jy-cy).^2); % promień do środka obrazu
[rms,j]=sort(rm);
imshow(ig), hold on
plot(cy,cx,'r+') % punkt centralny
plot(jY,jX,'bo') % punkty odniesienia

% identyfikacja modelu algorytmem LS
U=[rms, rms.^2, rms.^3];
Y=[rs];
Y = Y(1:140);
A=U\Y;
R=U*A;
figure, plot(rms,rs,'b.', rms,R,'g-', [0 3e2],[0 3e2],'r-')

% prostowanie obrazka
xx=1:sx;
yy=1:sy;
[XX,YY]=meshgrid(xx,yy);
RR=sqrt((XX-cx).^2+(YY-cy).^2);
RRr=RR*A(1)+RR.^2*A(2)+RR.^3*A(3);
RRu=RRr./RR;
i1r=interp2(i1g,(YY-cy).*RRu+cy,(XX-cx).*RRu+cx);
figure,
subplot(2,1,1),imagesc(i1g)
subplot(2,1,2),imagesc(i1r)
colormap gray

%No to jeszcze raz szukam miejsc przecięć 

final = uint8(255.0 * mat2gray(i1r));
imwrite(final, 'i1r.png');
im = imread('i1r.png');

[sx, sy]=size(im);
cx=sx/2; cy=sy/2;

wzorzec=[0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0
0 0 0 1 1 1 0 0 0];
ic=normxcorr2(wzorzec,im);
ig=ic<-0.7;
ig=bwmorph(ig,'shrink',Inf);

[ix,iy]=find(ig>0); % współrzędne przecięć linii
r=sqrt((ix-cx).^2+(iy-cy).^2); % promień do środka obrazu
[rs,i]=sort(r);
figure();
plot(ix, iy, 'b.');
title("Punkty przecięcia na nowym obrazku");
x_p = ix(1:14);
y_p = iy(1:14);
[a, b] = reglinp(x_p, y_p);
y_n = x_p.*a + b;
disp("Srednie odchylenie: ");
avg = mean(abs(y_p-y_n))

