% function hu=get_hu(t,p,x,u)
%  c = 25; % wpisz swoją wartość c jeśli inna
%     w = 3.5;
%     hu = p(1) / (c * w);

function hu = get_hu(t, p, x, u)
    % Parametry
    c = 25; % cm
    w = 3.5; % cm

    
    hu = p(1) / (c * w); 

  
   
    end