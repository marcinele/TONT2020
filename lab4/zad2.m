%Uzupelnienie danych
xk = [-5:1:5];
[~, N] = size(xk); 
yk = 1./(1+xk.^2);


step = 0.1;
%Metodą Lagrange'a

x_l = [-5:step:5];
[~, STOP] = size(x_l);
y_l = zeros(1, STOP);
for i=1:STOP
    y_l(i) = lagrange(x_l(i), yk, xk);
end
figure(1);
plot(x_l, y_l, 'b');
hold on

%Funkcjami sklejanymi I stopnia

step = 0.1;
x_s1 = [-5:step:5];
[~, STOP] = size(x_s1);
y_s1 = zeros(1, STOP);
j = 2;
for i=1:N-1
    x = xk(i);
    j = j-1;
    while(x <= xk(i+1))
        y_s1(j) = yk(i) + (yk(i+1)-yk(i))/(xk(i+1)-xk(i))*(x-xk(i));
        x = x + step;
        j = j+1;
    end
end


plot(x_s1, y_s1, 'r');
hold on

%Funkcjami sklejanymi III stopnia
xk = (-5:1:5)';
yk = 1./(1+xk.^2);
x_s3 = [-5:0.1:5];
cs = spline( xk', [0 yk' 0] );
y_s3 = ppval( cs, x_s3 );

plot(x_s3, y_s3, 'green');
hold on

x_f = [-5:0.1:5];
y_f = 1./(1+x_f.^2);

plot(x_f, y_f, 'black');
hold on

%Bledy

error1 = sum(abs(y_l-y_f))
error2 = sum(abs(y_s1-y_f))
error3 = sum(abs(y_s3-y_f))
