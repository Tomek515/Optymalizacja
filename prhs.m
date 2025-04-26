% function dp=prhs(t,x,u,p)
% 
%     x1 = x(1);
%     x2 = x(2);
%     x3 = x(3);
%     a=10;%cm
%     b=44.5;%cm
%     c=25;%stała
%     w=3.5;%cm
%     H=35;%cm
%     R=36.4;%cm
%     c1=20;%stala
%     c2=19;%stala
%     c3=21;%stala
% 
% dp(1)= (c1/2*c*w*sqrt(x1))*p(1)-(c1/(((2*w*((b-a)*x2/H))+a)*sqrt(x1)))*p(2);
% 
% term1 = (-(-c2) / (2 * sqrt(x2))) * w * ((b - a)/H * x2 + a);
% term2 = (c1 * sqrt(x1) - c2 * sqrt(x2)) * w * ((b - a)/H);
% num2 = term1 - term2;
% dem2 = (w * ((b - a)/H * x2 + a))^2;
% f3pox3 = c2 / (2 * w * sqrt(x2) * sqrt(2 * R * x3 - x3^2));
% f2pox2=num2/dem2;
% dp(2)=-(f2pox2*p(2)+f3pox3*p(3));
% 
% term3 = (-c3) / (2 * sqrt(x3)) * w * sqrt(2 * R * x3 - x3^2);
% term4 = (-c3 * sqrt(x3) * w *(R - x3)) / sqrt(2 * R * x3 - x3^2);
% num3 = term3 - term4;
% dem3 = w^2 * (2 * R * x3 - x3^2);
% dp(3) = -(num3 / dem3) * p(3);
% dp = [dp(1); dp(2); dp(3)];

function dp = prhs(t, x, u, p)
    % Parametry
    a = 10; % cm
    b = 44.5; % cm
    c = 25; % cm
    w = 3.5; % cm
    H = 35; % cm
    R = 36.4; % cm
    c1 = 20; % stała
    c2 = 19; % stała
    c3 = 21; % stała

    % Zabezpieczenia przed dzieleniem przez zero:
    if x(1) <= 0
        x(1) = eps;
    end
    if x(2) <= 0
        x(2) = eps;
    end
    if (2*R*x(3) - x(3)^2) <= 0
        x(3) = R/2; % bezpieczna wartość
    end

    % Liczymy pochodne po zmiennych stanu:
    
    % df1/dx1
    df1dx1 = -(c1/(2*c*w*sqrt(x(1))));

    % df2/dx1 i df2/dx2
    df2dx1 = (c1/(2*w*((b-a)*x(2)/H + a)*sqrt(x(1))));
    df2dx2 = -(c2*sqrt(x(2))*((b-a)/(H*w*((b-a)*x(2)/H + a)^2))) ...
             + (-(c2/(2*w*((b-a)*x(2)/H + a)*sqrt(x(2)))));

    % df3/dx2 i df3/dx3
    df3dx2 = (c2/(2*w*sqrt(2*R*x(3) - x(3)^2)*sqrt(x(2))));
    df3dx3 = -(w*((c2*sqrt(x(2)) - c3*sqrt(x(3))))*(R - x(3))) ...
             / (w^2 * (2*R*x(3) - x(3)^2)^(3/2)) ...
             - (c3/(2*w*sqrt(2*R*x(3) - x(3)^2)*sqrt(x(3))));

    % Teraz zapisujemy pochodne układu sprzężonego:
    dp1 = df1dx1 * p(1) + df2dx1 * p(2);
    dp2 = df2dx2 * p(2) + df3dx2 * p(3);
    dp3 = df3dx3 * p(3);

    % Ujemne pochodne zgodnie z zasadami adjointów
    dp = -[dp1; dp2; dp3];
end