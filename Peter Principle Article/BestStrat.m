function [x]=BestStrat(hierarchy,pyramid,index)
max=-1;
m=index(1)+1;
n=0;
    while(n==0)
    for i=1:pyramid.position(m)
        if hierarchy.competence(m,i)>max && hierarchy.competence(m,i)~=0 && hierarchy.competence(m,i)~=-1
            max=hierarchy.competence(m,i);
            n=i;
        end
    end
    if(n==0)
        m=m+1;
    end
    
    end
x=[m,n];


end