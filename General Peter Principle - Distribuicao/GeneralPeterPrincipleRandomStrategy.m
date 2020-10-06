function [efficiencyvector,distribuition] = GeneralPeterPrincipleRandomStrategy(hierarchy,pyramid,delta,timestep,p)
global levels
emptyList=[0,0];
range=1:timestep;
eff(range)=0;
eff(1)=efficiency(hierarchy,pyramid);
precision=0.001;
bin=0:precision:1;
sizebin=size(bin,2);
distribuition(1:levels,1:sizebin)=0;

for t=range(2:end)
    cont=1;
    %Demitindo e guardando as posições
    [hierarchy,emptyList]=FireCheck(hierarchy,pyramid,emptyList);  %


    while(~all(emptyList==0))%%%
        
        if emptyList(cont,1)~=levels
            %Escolha do agente no nível abaixo e transferência de
            %posição/transmissão de competênciaa
            indexChosen=RandomStrat(hierarchy,pyramid,emptyList(cont,:),p);
            [hierarchy,emptyList]=GeneralPeterPrinciple(hierarchy,emptyList(cont,:),indexChosen,emptyList,cont,delta);  
  
        else
            %Criação do agente no último nível
            hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=0.7+0.2*randn();
            hierarchy.age(emptyList(cont,1),emptyList(cont,2))=round(25+5*randn());
           
            %Caso o agente criado tenha valores não aceitáveis
            if(hierarchy.competence(emptyList(cont,1),emptyList(cont,2))>1)
                hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=1;
            end
            if(hierarchy.age(emptyList(cont,1),emptyList(cont,2)<18))
                hierarchy.age(emptyList(cont,1),emptyList(cont,2))=18;
            end
            %Preencheu o espaço vazio
            emptyList(cont,:)=0;
            cont=cont+1;
        end
    
    end
    
    %Calculando a eficiência no instante t
    eff(t)=efficiency(hierarchy,pyramid);
    
    %Adicionando a idade para todos
    hierarchy=addAge(hierarchy,pyramid);
    
    distribuition=Distribuition(hierarchy,pyramid,distribuition,precision);

end

distribuition=distribuition/size(range,2);

for i=1:levels
    distribuition(i,1:pyramid.position(i))=distribuition(i,1:pyramid.position(i))/pyramid.position(i);
end

efficiencyvector=100*eff;

end

