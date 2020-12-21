function y = wst(y1,x,N)
    y = zeros(1,N);
    for i=2:N
        y(i) = (y1(i)-y1(i-1))/(x(i)-x(i-1));
    end
end