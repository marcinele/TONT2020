function [u1, u2, u3] = values(L)
    u1 = zeros(1, L);
    u2 = [0 1 1 0.5 0.5 -1 -1];
    for i = 1:L
        if i == 1
            u1(i) = 1;
        else
            u1(i) = 0;
        end
    end
    for i = (numel(u2)+1):L
        u2(i) = 0;
    end
    u3 = sin(2*pi*2*(0:L-1)/L) + sin(2*pi*6*(0:L-1)/L);
end