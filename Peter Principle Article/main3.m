global levels
levels=6;
p=0.5;
timesteps=1000;
%Definindo o numero de posições e a responsabilidade de cada nível
pyramid.position = [1,5,11,21,41,81];
pyramid.responsibility=[1.0,0.9,0.8,0.6,0.4,0.2];

%Achando o número máximo de posíção entre todos os níveis
maxposition=max(pyramid.position);

%Inicializando a matriz com os agentes aleatóriamente.

for i=1:levels
    for j=1:maxposition
    hierarchy.competence(i,j)=7+2*randn();
    hierarchy.age(i,j)=round(25+5*randn());
    
    if(hierarchy.competence(i,j)>10)
        hierarchy.competence(i,j)=10;
    end
    
    if(hierarchy.age(i,j)<18)
        hierarchy.age(i,j)=18;
    end
    end
end


%tirando os elementos onde não deveria ter agentes

for i = 1:levels
    hierarchy.competence(i,(pyramid.position(i)+1):maxposition)=-1;
    hierarchy.age(i,(pyramid.position(i)+1):maxposition)=-1;
end

ComparacaoEstrategia(hierarchy,pyramid,p);
