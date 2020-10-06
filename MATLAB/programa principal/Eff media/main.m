clear;
rng('shuffle');
delta=0.8;
nc=12;
firethreshold=0.6;
levels=6;
x=2*[1,5,11,21,41,81];
y=[1.0,0.9,0.8,0.6,0.4,0.2];
timestep=600;
base=0.0;
amplitude=1-base;
a=0;
gama=1/60;

for i=1:25
efficiencydaga(i,:)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/30);
efficiencydagb(i,:)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/60);
efficiencydbga(i,:)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/30);
efficiencydbgb(i,:)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/60);
efficiencydagz(i,:)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
efficiencydbgz(i,:)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
end

mdaga=mean(efficiencydaga);
mdagb=mean(efficiencydagb);
mdbga=mean(efficiencydbga);
mdbgb=mean(efficiencydbgb);
mdagz=mean(efficiencydagz);
mdbgz=mean(efficiencydbgz);

plot(1:timestep,mdaga,1:timestep,mdbga,1:timestep,mdagb,1:timestep,mdbgb,1:timestep,mdagz,1:timestep,mdbgz);

xlabel('Tempo')
ylabel('Eficiência %')
title('Eficiências Médias nc=12')
legend('\delta =0.8 \gamma =1/30','\delta =0.2 \gamma =1/30','\delta =0.8 \gamma =1/60','\delta =0.2 \gamma =1/60','\delta =0.8 \gamma =0','\delta =0.2 \gamma =0');


