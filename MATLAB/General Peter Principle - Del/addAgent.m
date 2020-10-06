function [hierarchy] = addAgent(hierarchy,emptyList)
hierarchy.competence(emptyList(1,1),emptyList(1,2))=rand();
hierarchy.age(emptyList(1,1),emptyList(1,2))=randi([18,60]);
end

