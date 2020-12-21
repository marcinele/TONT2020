clear all;
temp_time = 0;
total_time = 0;
for i=1:1000
    a = randi(100, 100,100);
    b = randi(100, 100, 1);
    t1 = cputime();
    gauss(a,b);
    t2 = cputime() - t1;
    total_time = total_time + t2;
end
disp("Dla gaussa: ")
disp(total_time/1000)

temp_time = 0;
total_time = 0;
for i=1:1000
    a = randi(100, 100,100);
    b = randi(100, 100, 1);
    t1 = cputime();
    my_lu(a,b);
    t2 = cputime() - t1;
    total_time = total_time + t2;
end
disp("Dla lu: ")
disp(total_time/1000)