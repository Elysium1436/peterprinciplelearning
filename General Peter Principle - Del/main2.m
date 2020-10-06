global levels
levels=6;
%Definindo o numero de posi��es e a responsabilidade de cada n�vel
pyramid.position = [1,79,173,330,619,1298];
pyramid.responsibility=[1.0,0.0570,0.0509,0.0382,0.0265,0.0125];
%Achando o n�mero m�ximo de pos���o entre todos os n�veis
maxposition=max(pyramid.position);
precision=0.1;
p=0.5;
timesteps=1000;
%Inicializando a matriz com os agentes aleat�riamente.
for i=1:levels
    for j=1:maxposition
    hierarchy.competence(i,j)=rand();
    hierarchy.age(i,j)=round(25+5*randn());
    
    
    if(hierarchy.age(i,j)<18)
        hierarchy.age(i,j)=18;
    end
    end
end
%tirando os elementos onde n�o deveria ter agentes
for i = 1:levels
    hierarchy.competence(i,(pyramid.position(i)+1):maxposition)=-1;
    hierarchy.age(i,(pyramid.position(i)+1):maxposition)=-1;
end



delta=0:precision:1;
s=size(delta,2);



for i=1:s
[GPPBS(i,:)]=GeneralPeterPrincipleBestStrategy(hierarchy,pyramid,delta(i),timesteps);
[GPPWS(i,:)]=GeneralPeterPrincipleWorstStrategy(hierarchy,pyramid,delta(i),timesteps);
[GPPRS(i,:)]=GeneralPeterPrincipleRandomStrategy(hierarchy,pyramid,delta(i),timesteps,p);
end

for i=1:s
    MGPPBS(i)=mean(GPPBS(i,500:timesteps));
    MGPPWS(i)=mean(GPPWS(i,500:timesteps));
    MGPPRS(i)=mean(GPPRS(i,500:timesteps));
end


plot(delta,MGPPBS(:),'-',delta,MGPPWS(:),'-',delta,MGPPRS(:),'-');




