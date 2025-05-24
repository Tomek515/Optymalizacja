clc;
clear;


a = 10;     % cm
b = 44.5;   % cm
c = 25;     % cm
w = 3.5;    % cm
H = 35;     % cm
R = 36.4;   % cm

c1 = 20;    % stała przepływu 1
c2 = 19;    % stała przepływu 2
c3 = 21;    % stała przepływu 3


u = 0;   


x0 = ustalony(17);   


tspan = [0 100]; 


ode = @(t, x) [
    (u - 19 * sqrt(max(x(1), 0))) / (c * w);
    (c1 * sqrt(max(x(1), 0)) - c2 * sqrt(max(x(2), 0))) / ((w * ((b - a) * min(x(2), H) / H)) + a);
    (c2 * sqrt(max(x(2), 0)) - c3 * sqrt(max(x(3), 0))) / (w * sqrt(max(2 * R * x(3) - x(3)^2, 1e-6)))
];


[t, x] = ode45(ode, tspan, x0);


figure;
plot(t, x(:,1), 'b-', 'LineWidth', 2); hold on;
plot(t, x(:,2), 'r--', 'LineWidth', 2);
plot(t, x(:,3), 'g:', 'LineWidth', 2);
grid on;
xlabel('Czas [s]');
ylabel('Poziom cieczy [cm]');
legend('x_1 - zbiornik 1', 'x_2 - zbiornik 2', 'x_3 - zbiornik 3');
title('Symulacja poziomów cieczy w układzie trzech zbiorników');
