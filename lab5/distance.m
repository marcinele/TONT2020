function [ d ] = distance( fi1, fi2, lambda1, lambda2 )
    R = 6371*1000; % Promieñ Ziemi w metrach
    a = sin((fi2-fi1)/2)^2+cos(fi1)*cos(fi2)*sin((lambda2-lambda1)/2)^2;
    c = 2*atan2(sqrt(a),sqrt(1-a));
    d = R*c;
end

