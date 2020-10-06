function [hierarchy,emptyList]=CommonSense(hierarchy,indexEmpty,indexChosen,emptyList,cont)
x.competence=0;
x.competence=hierarchy.competence(indexChosen(1),indexChosen(2))+(-1+2*rand());

if(x.competence>10)
    x.competence=10;
end

if(x.competence<1)
    x.competence=1;
end

x.age=hierarchy.age(indexChosen(1),indexChosen(2));

hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;

emptyList(cont,:)=indexChosen;
%emptyList=[indexChosen;emptyList];
end