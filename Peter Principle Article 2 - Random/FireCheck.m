function [hierarchy,emptyList]=FireCheck(hierarchy,pyramid,emptyList)
global levels
% Essa fun��o "demite" agentes que fazem 60 anos ou obtem uma compet�ncia
%menor que 4.
cont=1;


for i=1:levels
    
    for j=1:pyramid.position(i)
        if (hierarchy.competence(i,j)<4) || (hierarchy.age(i,j)>=60)
            
            hierarchy.age(i,j)=0;
            hierarchy.competence(i,j)=0;
            emptyList(cont,:)=[i,j];
            cont=cont+1;
        end
    end
    
end
    
end

