clear;
rng('shuffle');
delta=0.8;
nc=6;
firethreshold=0.4;
levels=6;
x=[1,5,11,21,41,81];
y=[1.0,0.9,0.8,0.6,0.4,0.2];
timestep=500;
base=0.0;
amplitude=1-base;
a=0;
gama=1/60;
k=0:0.1:1;
n=35;
efficiencydga=zeros(n,timestep);
cut=250;
for j=1:11
   
    parfor i=1:n
        rng('shuffle');
    efficiencydga(i,:)=model(k(j),nc,firethreshold,levels,x,y,base,amplitude,timestep,1/30);
    efficiencydgb(i,:)=model(k(j),nc,firethreshold,levels,x,y,base,amplitude,timestep,1/60);
    efficiencydgz(i,:)=model(k(j),nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
    end

    mdga=mean(efficiencydga);
    mdgb=mean(efficiencydgb);
    mdgz=mean(efficiencydgz);
    m1(j)=mean(mdga((timestep-cut:timestep)));
    m2(j)=mean(mdgb((timestep-cut:timestep)));
    m3(j)=mean(mdgz((timestep-cut:timestep)));


end
save("finalnc66");