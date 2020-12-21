clear all;
close all;
% Zmienna -> r
% H = 0.33/pi*r^2

% 1. Taki sam koszt œscianki i denka
x = 0.01:0.01:0.5; %od 0.1 do 0.5 co 0.01
k = (sqrt(5)-1)/2; % wyklad s 5
a = 0.01;
b = 0.5;
xL = b-k*(b-a); 
xR = a+k*(b-a); 
while (b-a)>1e-6 
    if fun(xL) < fun(xR)            
        b = xR; 
        xR = xL; 
        xL = b-k*(b-a);      
    else
        a = xL;
        xL = xR; 
        xR = a+k*(b-a); 
    end
end
r1 = (a+b)/2

figure(1);
hold on
plot(x, arrayfun(@fun, x),'r'); 
plot(r1, arrayfun(@fun, r1) , 'b*')

% 2. Material denka jest dwa razy drozszy
k = (sqrt(5)-1)/2; 
a = 0.01;
b = 0.5;
xL = b-k*(b-a); 
xR = a+k*(b-a); 
while (b-a)>1e-6 
    if fun2(xL)  < fun2(xR)
        b = xR; 
        xR = xL; 
        xL = b-k*(b-a); 
    else
        a = xL;
        xL = xR; 
        xR = a+k*(b-a); 
    end
end
r2 = (a+b)/2

figure(2);
hold on
plot(x, arrayfun(@fun, x),'r');
plot(r2, arrayfun(@fun, r2) , 'b*')