function ComparacaoEstrategia(hierarchy,pyramid,p)
timestep=1000;

CSBS=zeros(50,timestep);
CSWS=zeros(50,timestep);
CSRS=zeros(50,timestep);
PPBS=zeros(50,timestep);
PPWS=zeros(50,timestep);
PPRS=zeros(50,timestep);

for i=1:50
    rng('shuffle');
    CSBS(i,:)=CommonSenseBestStrategy(hierarchy,pyramid,timestep);
    CSWS(i,:)=CommonSenseWorstStrategy(hierarchy,pyramid,timestep);
    CSRS(i,:)=CommonSenseRandomStrategy(hierarchy,pyramid,p,timestep);
    PPBS(i,:)=PeterPrincipleBestStrategy(hierarchy,pyramid,timestep);
    PPWS(i,:)=PeterPrincipleWorstStrategy(hierarchy,pyramid,timestep);
    PPRS(i,:)=PeterPrincipleRandomStrategy(hierarchy,pyramid,p,timestep);
end
CSBSM=mean(CSBS);
CSWSM=mean(CSWS);
CSRSM=mean(CSRS);
PPBSM=mean(PPBS);
PPWSM=mean(PPWS);
PPRSM=mean(PPRS);
hold on

title("Average Efficiency %");
xlabel("Time");
ylabel("Efficiency");
plot(1:timestep,CSBSM,"DisplayName","CSBS")
plot(1:timestep,CSWSM,"DisplayName","CSWS")
plot(1:timestep,CSRSM,"DisplayName","CSRS")
plot(1:timestep,PPBSM,"DisplayName","PPBS")
plot(1:timestep,PPWSM,"DisplayName","PPWS")
plot(1:timestep,PPRSM,"DisplayName","PPRS")


end

