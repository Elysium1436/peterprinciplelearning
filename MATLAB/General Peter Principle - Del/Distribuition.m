function [distribuition] = Distribuition(hierarchy,pyramid,distribuition,precision)
global levels


for i=1:levels
    for j=1:pyramid.position(i)
        x=hierarchy.competence(i,j);
        x=x/precision;
        y=int64(x)+1;
        distribuition(i,y)=distribuition(i,y)+1;
    end
end


end
