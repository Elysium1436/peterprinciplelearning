function [hierarchy] = ins(hierarchy,emptyList,cont)
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

end

