function [hierarchy,emptyList]=CommonSense(hierarchy,indexEmpty,indexChosen,emptyList)
x.competence=0;
x.competence=hierarchy.competence(indexChosen(1),indexChosen(2))+(-0.1+0.2*rand());

if(x.competence>1)
    x.competence=1;
end

if(x.competence<0)
    x.competence=0;
end

x.age=hierarchy.age(indexChosen(1),indexChosen(2));

hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;

emptyList(1,:)=[];
emptyList=[indexChosen;emptyList];
end