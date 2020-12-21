function xprim = rlc(t,x)
    R1 = 0.02; R2 = 0.5; C = 0.01; L1 = 1; L2 = 1.5; M=1;
    D = M/(L1*L2-M^2);
    A = [-R2*L2*D/M     R2*L2*D/L2     -L2*D/M;
          R1*D          -R2*L1*D/M       D;
          1/C           0                0 ;     ];
    B = [L2*D/M -D 0]';
    e = sin(t);
    xprim = A*x + B*e;
end