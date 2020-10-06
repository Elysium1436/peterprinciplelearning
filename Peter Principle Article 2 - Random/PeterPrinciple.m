function [hierarchy,emptyList]=PeterPrinciple(hierarchy,indexEmpty,indexChosen,emptyList,cont)
x.competence=7+2*randn();

while x.competence>10
    x.competence=7+2*randn();
end


x.age=hierarchy.age(indexChosen(1),indexChosen(2));

hierarchy.competence(indexEmpty(1),indexEmpty(2))=x.competence;
hierarchy.age(indexEmpty(1),indexEmpty(2))=x.age;


hierarchy.age(indexChosen(1),indexChosen(2))=0;
hierarchy.competence(indexChosen(1),indexChosen(2))=0;

emptyList(cont,:)=indexChosen;
%emptyList=[indexChosen;emptyList];
end