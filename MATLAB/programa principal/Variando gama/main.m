clear;
rng('shuffle');
delta=0.8;
nc=6;
firethreshold=0.4;
levels=6;
x=2*[1,5,11,21,41,81];
y=[1.0,0.9,0.8,0.6,0.4,0.2];
timestep=600;
base=0.4;
amplitude=1-base;
a=0;
gama=1/60;
k=linspace(0,1/30,11);
n=40;
efficiencydga=zeros(n,timestep);
cut=250;


for j=1:11
   
    for i=1:n
        rng('shuffle');
    efficiencydg1(i,:)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,k(j));
    %efficiencydg2(i,:)=model(0.5,nc,firethreshold,levels,x,y,base,amplitude,timestep,k(j));
    efficiencydg3(i,:)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,k(j));
    end
    
    mdga=mean(efficiencydg1);
    %mdgb=mean(efficiencydg2);
    mdgz=mean(efficiencydg3);
    m1(j)=mean(mdga((timestep-cut:timestep)));
    %m2(j)=mean(mdgb((timestep-cut:timestep)));
    m3(j)=mean(mdgz((timestep-cut:timestep)));


end
save("final3");