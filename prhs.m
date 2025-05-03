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
% dp = -[dp(1); dp(2); dp(3)];

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


    % if x(1) <= 0
    %     x(1) = eps;
    % end
    % if x(2) <= 0
    %     x(2) = eps;
    % end
    % if (2*R*x(3) - x(3)^2) <= 0
    %     x(3) = R/2; 
    % end




   
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    p1 = p(1);
    p2 = p(2);
    p3 = p(3);
    
    % dp1
    dp1 = -(4*p1/(35*sqrt(x1)) - (10*p2)/(sqrt(x1)*((69*x2)/20 + 10)));

    % dp2
    dp2 = -((p2*(2760*sqrt(x1)*sqrt(x2) - 1311*x2 + 3800)*10) / ...
            (sqrt(x2)*(69*x2 + 200)^2) ...
            - (19*sqrt(5)*p3) / (7*sqrt(x2)*sqrt(-x3*(5*x3 - 364))));

    % dp3
    dp3 = -((6916*p3*sqrt(x2) + 105*p3*x3^(3/2) - 190*p3*sqrt(x2)*x3) / ...
            (35*((364*x3)/5 - x3^2)^(3/2)));
    
    dp = -[dp1; dp2; dp3];
end

% function dp = prhs(t, x_val, u_val, p_val)
%     % Definicja zmiennych symbolicznych
%     syms x1 x2 x3 u real
% 
%     % Stałe
%     a = 10; % cm
%     b = 44.5; % cm
%     c = 25; % cm
%     w = 3.5; % cm
%     H = 35; % cm
%     R = 36.4; % cm
%     c1 = 20;
%     c2 = 19;
%     c3 = 21;
% 
%     % Definicja funkcji f1, f2, f3 (prawe strony oryginalnych równań)
%     f1 = (u - c1 * sqrt(x1)) / (c * w);
%     f2 = (c1 * sqrt(x1) - c2 * sqrt(x2)) / (w * ((b - a) * x2 / H + a));
%     f3 = (c2 * sqrt(x2) - c3 * sqrt(x3)) / (w * sqrt(2*R*x3 - x3^2));
% 
%     % Wektor funkcji
%     f = [f1; f2; f3];
% 
%     % Zmienna stanu
%     X = [x1; x2; x3];
% 
%     % Liczenie Jacobiego (macierz pochodnych cząstkowych df/dx)
%     J = jacobian(f, X);
% 
%     % Podstawienie wartości rzeczywistych (x_val, u_val)
%     J_num = double(subs(J, [x1, x2, x3, u], [x_val(1), x_val(2), x_val(3), u_val]));
% 
%     % Liczenie dp
%     dp = J_num.' * p_val; % uwaga: transpozycja, bo dp = (Jacobian)' * p
% 
%     % Zwrócenie minus dp
%     dp = -dp;
% end

% function dp = prhs(t, x_val, u_val, p_val, jac_func)
%     J_num = jac_func(x_val, u_val); % szybkie liczenie macierzy Jacobiego
%     dp = -J_num.' * p_val;          % sprzężone równanie: dp/dt = -Jᵀ * p
% end