function [hierarchy,emptyList]=PeterPrinciple(hierarchy,indexEmpty,indexChosen,emptyList)
delta=1;
x.competence=1+9*rand();
x.age=hierarchy.age(indexChosen(1),indexChosen(2));

hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;

emptyList(1,:)=[];
emptyList=[indexChosen;emptyList];
end