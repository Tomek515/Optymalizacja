function u=get_hmax(t,p,x,u)
 %Hamiltonian maximizer
   c = 25;     % cm
    w = 3.5;    % cm
    uf=86.585218137970884;
    r=0.01;
   
    u = uf+p(:,1) / (r*c * w);
    %u = p(:,1)/(c*w) - (r*(2*u - 2*uf))/2;
end 