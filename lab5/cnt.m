function y = cnt(y1,x,N)
    y = zeros(1,N);
    for i=2:N-1
        y(i) = (y1(i+1)-y1(i-1))/(2*(x(i)-x(i-1)));
    end
end