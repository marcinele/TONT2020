function y = my_integral(v,t)
    N = length(v);
    y = zeros(1,N);
    m = zeros(1,N);
    m(2:2:N) = 4;
    m(3:2:N) = 2;
    y(1) = m(1)*v(1)*(t(2)-t(1));
    for i=2:N-1
        y(i) = y(i-1) + m(i)*v(i)*(t(i+1)-t(i));
    end
    y = y/3;
end