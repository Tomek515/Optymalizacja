function dx = rhs(t, x, u)
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);

    dx1 = (u - 19 * sqrt(x1)) / 87.5;
    dx2 = (20 * sqrt(x1) - 19 * sqrt(x2)) / (3.45 * x2 + 10);
    dx3 = (19 * sqrt(x2) - 21 * sqrt(x3)) / (3.45 * sqrt(72.8 * x3 - x3^2));

    dx = [dx1; dx2; dx3];
end

