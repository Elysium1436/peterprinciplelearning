function [hierarchy,emptyList]=GeneralPeterPrinciple(hierarchy,indexEmpty,indexChosen,emptyList,cont,delta)
x.competence=hierarchy.competence(indexChosen(1),indexChosen(2))*delta+rand()*(1-delta);
x.age=hierarchy.age(indexChosen(1),indexChosen(2));

while(x.competence>1)
    x.competence=hierarchy.competence(indexChosen(1),indexChosen(2))*delta+rand()*(1-delta);
end

if (x.competence<=0)
    x.competence=0.00001;
end
    


hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;

emptyList(cont,:)=indexChosen;

end