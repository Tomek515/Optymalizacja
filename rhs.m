function dx = rhs(t, x, u)
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


    %dx1 = (u - 19 * sqrt(x1)) / 87.5;
    %dx2 = (20 * sqrt(x1) - 19 * sqrt(x2)) / (3.45 * x2 + 10);
    %dx3 = (19 * sqrt(x2) - 21 * sqrt(x3)) / (3.45 * sqrt(72.8 * x3 - x3^2));

    if x1 < 0
        x1 = 0;
    end
    if x2 < 0
        x2 = 0;
    end
    if x3 < 0
        x3 = 0;
    end
    
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

    dx = [dx1; dx2; dx3];
end

% function [f, X, u] = rhs()
%     syms x1 x2 x3 u real
% 
%     Stałe
%     a = 10; b = 44.5; c = 25; w = 3.5; H = 35; R = 36.4;
%     c1 = 20; c2 = 19; c3 = 21;
% 
%     Dynamika (uwaga: bez ifów ograniczających zakresy)
%     dx1 = (u - c1 * sqrt(x1)) / (c * w);
%     dx2 = (c1 * sqrt(x1) - c2 * sqrt(x2)) / (w * ((b - a)*x2/H + a));
%     dx3 = (c2 * sqrt(x2) - c3 * sqrt(x3)) / (w * sqrt(2*R*x3 - x3^2));
% 
%     f = [dx1; dx2; dx3];
%     X = [x1; x2; x3];
% end