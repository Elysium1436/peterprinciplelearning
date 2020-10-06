function efficiencyvector = CommonSenseRandomStrategy(hierarchy,pyramid,p,timestep)
global levels

%Quantidade de itera��es 
range=1:timestep;
emptyList=[0,0];
eff(range)=0;

%Efici�ncia Inicial
eff(1)=efficiency(hierarchy,pyramid);


for t=range(2:end)
    cont=1;
    %Demitindo e guardando as posi��es
    [hierarchy,emptyList]=FireCheck(hierarchy,pyramid,emptyList);  %


    while(~all(emptyList==0))%%%
        
        if emptyList(cont,1)~=levels
            %Escolha do agente no n�vel abaixo e transfer�ncia de
            %posi��o/transmiss�o de compet�nciaa
            indexChosen=RandomStrat(hierarchy,pyramid,emptyList(cont,:),p);
            [hierarchy,emptyList]=CommonSense(hierarchy,emptyList(cont,:),indexChosen,emptyList,cont);  
            
        else
           hierarchy=ins(hierarchy,emptyList,cont);
            %Preencheu o espa�o vazio
            emptyList(cont,:)=0;
            cont=cont+1;
        end
    
    end
    
    %Calculando a efici�ncia no instante t
    eff(t)=efficiency(hierarchy,pyramid);
    
    %Adicionando a idade para todos
    hierarchy=addAge(hierarchy,pyramid);

end
efficiencyvector=100*eff;

end

