function [distribuition] = Distribuition(hierarchy,pyramid,distribuition,precision,maxEfficiency,levels)

for i=1:levels
    for j=1:pyramid(i).size
        x=efficiency(pyramid,hierarchy,i,j)/maxEfficiency(i);
        x=x/precision;
        y=int64(x)+1;
        distribuition(i,y)=distribuition(i,y)+1;
    end
end


end
