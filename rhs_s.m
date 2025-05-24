function dx=rhs_s(t,x,u)
   x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    a=10;%cm
    b=44.5;%cm
    c=25;%cm
    w=3.5;%cm
    H=35;%cm
    R=36.4;%cm
    c1=20;%stala
    c2=19;%stala
    c3=21;%stala



    if x1 < 0
        x1 = 0;
    end
    if x2 < 0
        x2 = 0;
    end
    if x3 < 0
        x3 = 0;
    end
    %max wysokosc
    if x1 > H
        x1 = H;
    end
    if x2 > H
        x2 = H;
    end
    if x3 > R
        x3 = R;
    end

    dx1 = (u - c1 * sqrt(x1)) / (c*w);
    dx2 = (c1 * sqrt(x1) - c2 * sqrt(x2)) / ((w*((b-a)*x2/H))+a);
    dx3 = (c2 * sqrt(x2) - c3 * sqrt(x3)) / (w * sqrt(2*R * x3 - x3^2));

    %xustalony = ustalony(3);
    xf=[ 18.742500000000007  20.767313019390588  17.000000000000000]';
    uf=86.585218137970884;
    r=0.001;
    dx4 = 0.5*((x1 - xf(1))^2 + (x2 - xf(2))^2 + (x3 - xf(3))^2 + r*(u-uf)^2);
    %dx4 = 0.5*((x1 - xf(1))^2  + u^2);
    dx = [dx1; dx2; dx3; dx4];
end