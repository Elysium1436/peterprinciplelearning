global levels
levels=6;

timesteps=1000;
%Definindo o numero de posi��es e a responsabilidade de cada n�vel
pyramid.position = [1,5,11,21,41,81];
pyramid.responsibility=[1.0,0.9,0.8,0.6,0.4,0.2];

%Achando o n�mero m�ximo de pos���o entre todos os n�veis
maxposition=max(pyramid.position);

%Inicializando a matriz com os agentes aleat�riamente.
for i=1:levels
    for j=1:maxposition
    hierarchy.competence(i,j)=7+2*randn();
    hierarchy.age(i,j)=round(25+5*randn());
    
    while(hierarchy.competence(i,j)>10)
        hierarchy.competence(i,j)=7+2*randn();
    end
    
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


eff1=zeros(50,timesteps);
eff2=zeros(50,timesteps);

p=0:0.2:1.0;


for j=1:6
   
    for i=1:50
    eff1(i,:)=CommonSenseRandomStrategy(hierarchy,pyramid,p(j),timesteps);
    eff2(i,:)=PeterPrincipleRandomStrategy(hierarchy,pyramid,p(j),timesteps);    
    end
    
    effM1=mean(eff1);
    effM2=mean(eff2);
  
    CSRS(j)=mean(effM1(600:1000));
    PPRS(j)=mean(effM2(600:1000));
    
end

hold on;
plot(p,flip(CSRS),"b--o","DisplayName","Senso Comum")
plot(p,flip(PPRS),"r--o","DisplayName","Princ�pio de Peter")
title("Probabilidade x Efici�ncia M�dia")
xlabel("Probabilidade")
ylabel("Efici�ncia M�dia (%)")
legend("Senso Comum", "Princ�pio de Peter")

