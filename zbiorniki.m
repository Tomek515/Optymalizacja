
clear all
clc


clear
clc
clear all
%tauopt=[40 80 130]'/10;
tauopt=[68.0373 114.6129 128.1159]';
u=150*[1;0;1];
x0=ustalony(5);
xf=ustalony(17);
W=1000*eye(3);
MDNS=50;
qh=@(tauopt) cost_fun(tauopt,u,x0,xf,W,MDNS);
nb=length(tauopt);
Aeq = ones(1, nb);
beq = 300;
b=0.0*ones(nb,1);A=-eye(nb);
for k=2:nb, A(k,k-1)=1;end %ograniczenia
options=optimoptions('fmincon');
options.SpecifyObjectiveGradient=true;
options.Display='iter';
options.Algorithm='interior-point';
options.MaxIterations = 1000;
tauopt=fmincon(qh,tauopt,A,b,[],[],[],[],[],options);
[t,x,uk,nseg]=get_tx(tauopt,u,x0,MDNS);
pf=-W*(x(end,:)'-xf);
p=rk4p(pf,t,x,uk);nt=length(t);hu=zeros(nt,1);
for k=1:nt
hu(k)=get_hu(t(k),p(k,:)',x(k,:)',uk(k,:)');
end
hu=hu/max(abs(hu));
subplot(211);
h=plot(t,x);
set(h,'linewidth',2);
subplot(212);
h=stairs(t,uk/max(uk));
set(h,'linewidth',2);
hold on;
h=plot(t,hu);
grid;set(h,'linewidth',2);
axis([0 t(end) -1.1 1.1]);
hold off



