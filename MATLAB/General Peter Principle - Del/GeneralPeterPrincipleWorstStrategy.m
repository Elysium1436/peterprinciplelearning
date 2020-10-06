function [efficiencyvector] = GeneralPeterPrincipleWorstStrategy(hierarchy,pyramid,delta,timestep)
global levels
emptyList=[0,0];
range=1:timestep;
eff(range)=0;
eff(1)=efficiency(hierarchy,pyramid);



for t=range(2:end)
    cont=1;
    %Demitindo e guardando as posições
    [hierarchy,emptyList]=FireCheck(hierarchy,pyramid,emptyList);  %


    while(~all(emptyList==0))%%%
        
        if emptyList(cont,1)~=levels
            %Escolha do agente no nível abaixo e transferência de
            %posição/transmissão de competênciaa
            indexChosen=WorstStrat(hierarchy,pyramid,emptyList(cont,:));
            [hierarchy,emptyList]=GeneralPeterPrinciple(hierarchy,emptyList(cont,:),indexChosen,emptyList,cont,delta);  
  
        else
            %Criação do agente no último nível
            hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=rand();
            hierarchy.age(emptyList(cont,1),emptyList(cont,2))=round(25+5*randn());
           
            %Caso o agente criado tenha valores não aceitáveis
            if(hierarchy.competence(emptyList(cont,1),emptyList(cont,2))>1)
                hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=1;
            end
            
            if(hierarchy.competence(emptyList(cont,1),emptyList(cont,2))<=0)
                hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=0.01;
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

    
end


efficiencyvector=100*eff;

end

