function [a,b] = reglinp(x, y)
    X = [x, ones(length(x),1)];
    A = pinv(X)*y;
    a = A(1);
    b = A(2);
end