function [x] = RandomStrat(hierarchy,pyramid,index,percent)

if(rand()<=percent)
    x=WorstStrat(hierarchy,pyramid,index);
else
    x=BestStrat(hierarchy,pyramid,index);

end



end

