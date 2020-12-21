clear all;
close all;

x0 = [5,5]; %zakres w którym szukamy minimum
%xmin - argument dla minimun, val - wartość dla tego argumentu
[xmin,val]=fminunc(@fun,x0)


xs = [(-5:0.1:5);(-5:0.1:5)];
xs = xs';
x = xs(:,1);
y = xs(:,2);
z = zeros(101);
for i=1:length(x)
    for j=1:length(y)
        x_temp = [x(i),y(j)];
        z(i,j) = fun(x_temp);
    end
end
surf(x,y,z);
hold on;
scatter3 (xmin(1), xmin(2), fun (xmin), "r", "filled");


function f = fun(x)
    
f = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2; % Funkcja Rosenbrocka

end

