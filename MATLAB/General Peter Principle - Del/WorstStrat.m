function x=WorstStrat(hierarchy,pyramid,index)
min=100;
m=index(1)+1;
    for i=1:pyramid.position(m)
        if hierarchy.competence(m,i)<min && hierarchy.competence(m,i)~=0 && hierarchy.competence(m,i)~=-1
            min=hierarchy.competence(m,i);
            n=i;
        end
    end
    x=[m,n];
end
