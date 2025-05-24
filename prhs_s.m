function dp = prhs_s(t, x, u, p)
    dp = zeros(4,1);

    % Parametry
    a = 10; b = 44.5; c = 25; w = 3.5; H = 35; R = 36.4;
    c1 = 20; c2 = 19; c3 = 21;

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    p1 = p(1);   
    p2 = p(2);
    p3 = p(3);
    p4=  p(4);
    % dp1
    dp1 = -(4*p1/(35*sqrt(x1)) - (10*p2)/(sqrt(x1)*((69*x2)/20 + 10)));

    % dp2
    dp2 = -((p2*(2760*sqrt(x1)*sqrt(x2) - 1311*x2 + 3800)*10) / ...
            (sqrt(x2)*(69*x2 + 200)^2) ...
            - (19*sqrt(5)*p3) / (7*sqrt(x2)*sqrt(-x3*(5*x3 - 364))));

    % dp3
    dp3 = -((6916*p3*sqrt(x2) + 105*p3*x3^(3/2) - 190*p3*sqrt(x2)*x3) / ...
            (35*((364*x3)/5 - x3^2)^(3/2)));

    
    r=0.001;
    df1du = 1 / (c * w);
    dLdu =  r*u;
    dp4 = p1 * df1du - dLdu;

    dp = -[dp1; dp2; dp3; -dp4];
end
