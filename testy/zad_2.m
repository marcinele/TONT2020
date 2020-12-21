%Obliczenia
clear all;

format long;

[x1, x2, x3, x4] = roots(single(0.1), single(-100), single(-0.1));
a1 = [x1, x2, x3, x4]
[x1, x2, x3, x4] = roots(0.1, -100, -0.1);
a2 = [x1, x2, x3, x4]


%Uwarunkowanie zadania obliczeniowego -101

[x1, x2, x3, x4] = roots(single(0.1), single(-101), single(-0.1));
a1_101 = [x1, x2, x3, x4];
[x1, x2, x3, x4] = roots(0.1, -101, -0.1);
a2_101 = [x1, x2, x3, x4];

cond_x1_single_1 = abs( ((a1(1)- a1_101(1))/a1(1))/((-100+101)/100))
cond_x2_single_1 = abs( ((a1(2)- a1_101(2))/a1(2))/((-100+101)/100))

cond_x1_single_2 = abs( ((a1(3)- a1_101(3))/a1(3))/((-100+101)/100))
cond_x2_single_2 = abs( ((a1(4)- a1_101(4))/a1(4))/((-100+101)/100))

cond_x1_double_1 = abs( ((a2(1)- a2_101(1))/a2(1))/((-100+101)/100))
cond_x2_double_1 = abs( ((a2(2)- a2_101(2))/a2(2))/((-100+101)/100))

cond_x1_double_2 = abs( ((a2(3)- a2_101(3))/a2(3))/((-100+101)/100))
cond_x2_double_2 = abs( ((a2(4)- a2_101(4))/a2(4))/((-100+101)/100))






