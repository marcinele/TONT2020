clear all;

epsilon = 1;
i = 0;
while 1+epsilon > 1
   epsilon = epsilon/2;
   i = i+1;
end

disp(i-1)
disp(epsilon*2)