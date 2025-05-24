clear;close all;

nu=100;
tf=150;
umax=150;
umin=0;
tau=(tf/nu)*[1:nu]';
uopt=86.585218137970884*ones(nu,1);
%uopt=89.585218137970884*ones(nu,1);
xustalony = ustalony(3);
x0= [xustalony(1) xustalony(2) xustalony(3) 0]';          
            
[xf,uf] = ustalony(17);    
W = 1000*eye(3);    
 MDNS=500;
 qh=@(uopt) cost_fun_s(uopt,tau,x0,xf,W,MDNS);
 nu=length(uopt);
 LB=umin*ones(nu,1);UB=umax*ones(nu,1);%ograniczenia
 %LB=-ones(nu,1);UB=ones(nu,1);%ograniczenia
 options=optimoptions('fmincon');
 options.SpecifyObjectiveGradient=true;
 options.Display='iter';options.Algorithm='interior-point';
 uopt=fmincon(qh,uopt,[],[],[],[],LB,UB,[],options);
 [t,x,uk,nseg]=get_tx_s(tau,uopt,x0,MDNS);
 pf=[-W*(x(end,1:end-1)'-xf);0];
 p=rk4p_s(pf,t,x,uk);
 hmax=get_hmax(t,p,x,uk);
 subplot(211);
 h = plot(t, [x(:,1), x(:,2), x(:,3)]);
 subplot(212);
 h=plot(t,hmax);
 set(h,'linewidth',2);
 hold on;h=stairs(t,uk);
 set(h,'linewidth',2);
 axis([0 t(end) umin-10 umax+10]);
 hold off