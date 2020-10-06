function efficiencyvector = CommonSenseRandomStrategy(hierarchy,pyramid,p,timestep)
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
            %posição/transmissão de competênciaa
            indexChosen=RandomStrat(hierarchy,pyramid,emptyList(cont,:),p);
            [hierarchy,emptyList]=CommonSense(hierarchy,emptyList(cont,:),indexChosen,emptyList,cont);  
            
        else
           hierarchy=ins(hierarchy,emptyList,cont);
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

