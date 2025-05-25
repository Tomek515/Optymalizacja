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


   


  

   
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    p1 = p(1);
    p2 = p(2);
    p3 = p(3);
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

