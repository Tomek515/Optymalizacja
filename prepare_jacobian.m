syms x1 x2 x3 u p1 p2 p3 real
a = 10; b = 44.5; c = 25; w = 3.5; H = 35; R = 36.4;
c1 = 20; c2 = 19; c3 = 21;

% Układ stanu
f1 = (u - c1 * sqrt(x1)) / (c*w);
f2 = (c1 * sqrt(x1) - c2 * sqrt(x2)) / ((w*((b-a)*x2/H)) + a);
f3 = (c2 * sqrt(x2) - c3 * sqrt(x3)) / (w * sqrt(2*R * x3 - x3^2));
f = [f1; f2; f3];

x = [x1; x2; x3];
p = [p1; p2; p3];

J = jacobian(f, x);        
adj_rhs = -J.' * p;        

dp1 = simplify(adj_rhs(1));
dp2 = simplify(adj_rhs(2));
dp3 = simplify(adj_rhs(3));

disp('dp1 = ')
pretty(dp1)

disp('dp2 = ')
pretty(dp2)

disp('dp3 = ')
pretty(dp3)
