function eff = globalEfficiency(hierarchy,pyramid,levels,maxGlobalEfficiency)
sum=0;

for i=1:levels
    for j=1:pyramid(i).size
        sum=sum+efficiency(pyramid,hierarchy,i,j)*pyramid(i).responsibility;
    end
end

eff=(sum/maxGlobalEfficiency)*100;




end

