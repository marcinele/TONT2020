%Definicja zmiennych
i = 200;
j = 1000;
k = 0.01;
h = 0.006;
D = 0.00003;
lambda = k*D/h^2;
disp("Stabilność: " + 2*k*D*h^2);
przek = zeros(i,i);
iter = 0;

%Formowanie macierzy przekątnej
for a=1:i
    if iter > 0 && iter <=i
        przek(iter, a) = -1*lambda;
    end
    if iter+1 > 0 && iter+1<=i
        przek(iter+1,a) = 1-2*lambda;
    end
    if iter+2 > 0 && iter+2<=i
        przek(iter+2,a) = lambda;
    end 
    iter = iter + 1;
end

T = zeros(i,j);
T(:,1) = 200;

for a=1:j
    T(:,a+1) = przek*T(:,a);
end

imshow(T);