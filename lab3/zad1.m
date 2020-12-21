R1 = 5e-3; R2 = 1e-3; R0 = 0.1;
E1 = 12.1; E2 = 11.9;

a = [R1 + R2, -R2;
     -R2, R2+R0];
b = [E1 - E2; E2];

disp(gauss(a,b));