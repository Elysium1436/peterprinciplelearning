clear;
rng('shuffle');
delta=0.8;
nc=6;
firethreshold=0.4;
levels=6;
x=2*[3,5,11,21,41,81];
y=[1.0,0.9,0.8,0.6,0.4,0.2];
timestep=15000;
base=0.0;
amplitude=1-base;
a=0;
gama=1/60;
%mudie timestep de 30000 pra 15000, fiz media de 10x

ds1=zeros(6,1001,10);
ds2=zeros(6,1001,10);
ds3=zeros(6,1001,10);
ds4=zeros(6,1001,10);

parfor i=1:10
    ds1(:,:,i)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
    ds2(:,:,i)=model(0.2,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/60);
    ds3(:,:,i)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,0);
    ds4(:,:,i)=model(0.8,nc,firethreshold,levels,x,y,base,amplitude,timestep,1/60);

end

    
ds1=mean(ds1,3);
ds2=mean(ds2,3);
ds3=mean(ds3,3);
ds4=mean(ds4,3);
   

plotardistribuicao(ds1,levels)
title("Distribuíção de Competências \delta=0.2 \gamma=0")
saveas(gcf,"ds1.pdf")
close

plotardistribuicao(ds2,levels)
title("Distribuíção de Competências \delta=0.2 \gamma=1/60")
saveas(gcf,"ds2.pdf")
close

plotardistribuicao(ds3,levels)
title("Distribuíção de Competências \delta=0.8 \gamma=0")
saveas(gcf,"ds3.pdf")
close

plotardistribuicao(ds4,levels)
title("Distribuíção de Competências \delta=0.8 \gamma=1/60")
saveas(gcf,"ds4.pdf")
close

save('dados.mat')
