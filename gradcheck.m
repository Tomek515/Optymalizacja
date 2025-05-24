clear;close all
 tau=[69.6141   116.2394  129.7457]';
 u=150*[1;0;1];
 x0=ustalony(3);
 xf=ustalony(17);
 W=1000*eye(3);
 MDNS=50;
 
 ep=1e-7;gnum=zeros(length(tau),1);
 [~,g]=cost_fun(tau,u,x0,xf,W,MDNS);
 for k=1:length(tau)
 ei=zeros(length(tau),1);ei(k)=1;
 taup=tau+ei*ep;taum=tau-ei*ep;
 [fp,~]=cost_fun(taup,u,x0,xf,W,MDNS);
 [fm,~]=cost_fun(taum,u,x0,xf,W,MDNS);
 gnum(k)=(fp-fm)/(2*ep);
 end
 %porownanie g- r. sprz., gnum- rozn.
 [g';gnum']