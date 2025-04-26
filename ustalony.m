% function xx=ustalony(x3)
% x2 = (21/19)^2*x3;
% x1 = (20/19)^2*x3;
% xx = [x1; x2; x3];

function xx = ustalony(x3)
    u=150
     c = 25;    % stała
    w = 3.5;   % cm
    a = 10;    % cm
    b = 44.5;  % cm
    H = 35;    % cm
    R = 36.4;  % cm
     c1=20;%stala
    c2=19;%stala
    c3=21;%stala
      x2 = c2^2 * x3 / (c3^2);
    
    
    x1 = (c1^2 / c2^2) * x2;
    xx = [x1; x2; x3];
end