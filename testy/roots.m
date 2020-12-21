function [x11, x21, x12, x22] = roots(a, b, c)

    x11 = (-b + sqrt(b^2-4*a*c))/(2*a);
    x21 = (-b - sqrt(b^2-4*a*c))/(2*a);
    x12 = (-2*c)/(b+sqrt(b^2-4*a*c));
    x22 = (-2*c)/(b-sqrt(b^2-4*a*c));

end