function [hierarchy,emptyList]=PeterPrinciple(hierarchy,indexEmpty,indexChosen,emptyList,cont)

x.competence=7+2*randn();

if(x.competence>10)
    x.competence=10;
end

if(x.competence<=0)
    x.comeptence=0.01;
end


x.age=hierarchy.age(indexChosen(1),indexChosen(2));

hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;


emptyList(cont,:)=indexChosen;
end