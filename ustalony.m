% function xx=ustalony(x3)
% x2 = (21/19)^2*x3;
% x1 = (20/19)^2*x3;
% xx = [x1; x2; x3];

function [xf,uf] = ustalony(x3)
    a=10;%cm
    b=44.5;%cm
    c=25;%cm
    w=3.5;%cm
    H=35;%cm
    R=36.4;%cm
    c1=20;%stala
    c2=19;%stala
    c3=21;%stala
    x2 = (c3/c2)^2*x3;
    x1 = (c2/c1)^2*x2;
    xf = [x1; x2; x3];
    uf=c1*sqrt(x1);
end