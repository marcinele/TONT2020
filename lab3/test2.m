clear all;
close all;
total_time1 = 0;
total_time2 = 0;

s = zeros(1,100);
ans1 = zeros(100, 10);
ans2 = zeros(100, 10);
for i=1:100
    a = macierz_rzadka();
    b = randi(100, 10, 1);
    
    %Dla LU
    t1 = cputime();
    ans1(i,:) = my_lu(a,b);
    t2 = cputime() - t1;
    total_time1 = total_time1 + t2;
    
    %Dla Jacobiego
    t1 = cputime();
    ans2(i,:) = metoda_jacobiego(a,b);
    t2 = cputime() - t1;
    total_time2 = total_time2 + t2;
    
    s(i) = sum(abs(ans1(i)-ans2(i)));
end
s = s';
figure(1);
plot(s);
disp("Dla my_lu: ")
disp(total_time1/100)
disp("Dla Jacobiego: ")
disp(total_time2/100)


