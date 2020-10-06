global levels
levels=6;
delta=0.9;
%Definindo o numero de posições e a responsabilidade de cada nível
pyramid.position = [10,79,173,330,619,1298];
pyramid.responsibility=[1.0,0.0570,0.0509,0.0382,0.0265,0.0125];
%Achando o número máximo de posíção entre todos os níveis
maxposition=max(pyramid.position);

%Inicializando a matriz com os agentes aleatóriamente.
for i=1:levels
    for j=1:maxposition
    hierarchy.competence(i,j)=rand();
    hierarchy.age(i,j)=round(25+5*randn());
    
    
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

[GPPBS,DS]=GeneralPeterPrincipleBestStrategy(hierarchy,pyramid,delta,10000);


plotardistribuicao(DS);

title("Melhor; L=6; 2509 Trabalhadores; \delta=0.9");
legend("CEO L=1","L=2","L=3","L=4","L=5","L=6")
xlabel("Competence");
ylabel("Probability");

hold off;

