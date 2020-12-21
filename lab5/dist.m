function d = dist(m)
[N, ~] = size(m);
d = zeros(1,N-1);

%Obliczanie dystansu
for i = 2:N
    d(i-1) = sqrt( (m(i,1)-m(i-1,1))^2 + (m(i,2)-m(i-1,2))^2 + (m(i,3)-m(i-1,3))^2 );
end

end