clear;
rng('shuffle');
delta=0.8;
nc=6;
firethreshold=0.4;
levels=6;
x=[1,5,11,21,41,81];
y=[1.0,0.9,0.8,0.6,0.4,0.2];
timestep=1000;
base=0.0;
amplitude=1-base;
a=0;
gama=1/60;

for i=1:50
efficiencybest8(i,:)=modelBest(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencyworst8(i,:)=modelWorst(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencyrandom8(i,:)=modelRandom(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencybest2(i,:)=modelBest(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencyworst2(i,:)=modelWorst(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencyrandom2(i,:)=modelRandom(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
end

mbest8=mean(efficiencybest8);
mworst8=mean(efficiencyworst8);
mrandom8=mean(efficiencyrandom8);
mbest2=mean(efficiencybest2);
mworst2=mean(efficiencyworst2);
mrandom2=mean(efficiencyrandom2);


plot(1:timestep,mbest8,     1:timestep,mbest2,    1:timestep,mworst8,       1:timestep,mworst2,   1:timestep,mrandom8,      1:timestep,mrandom2);

xlabel('Tempo')
ylabel('Eficiência %')
title('Eficiências Médias \gamma=1/30')
legend('Estratégia Melhor \delta=0.8','Estratégia Melhor \delta=0.2','Estratégia Pior \delta=0.8', 'Estratégia Pior \delta=0.2','Estratégia Aleatória \delta=0.8', ...
              'Estratégia Aleatória \delta=0.2');
legend('Location','southeast')

saveas(gcf,'melhorpioraleatoriagamma30.pdf')
