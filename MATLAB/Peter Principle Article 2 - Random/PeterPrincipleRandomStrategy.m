function efficiencyvector = PeterPrincipleRandomStrategy(hierarchy,pyramid,p,timestep)
global levels

%Quantidade de iterações 
range=1:timestep;
emptyList=[0,0];
eff(range)=0;

%Eficiência Inicial
eff(1)=efficiency(hierarchy,pyramid);


for t=range(2:end)
    cont=1;
    %Demitindo e guardando as posições
    [hierarchy,emptyList]=FireCheck(hierarchy,pyramid,emptyList);  %


    while(~all(emptyList==0))%%%
        
        if emptyList(cont,1)~=levels
            %Escolha do agente no nível abaixo e transferência de
            %posição/transmissão de competência
            indexChosen=RandomStrat(hierarchy,pyramid,emptyList(cont,:),p);
            [hierarchy,emptyList]=PeterPrinciple(hierarchy,emptyList(cont,:),indexChosen,emptyList,cont);  
            
        else
            %Criação do agente no último nível
            hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=7+2*randn();
           
            
            hierarchy.age(emptyList(cont,1),emptyList(cont,2))=round(25+5*randn());
           
            %Caso o agente criado tenha valores não aceitáveis
            if(hierarchy.competence(emptyList(cont,1),emptyList(cont,2))>10)
                hierarchy.competence(emptyList(cont,1),emptyList(cont,2))=10;
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

