function [x] = RandomStrat(hierarchy,pyramid,index,percent)


if(rand()<=percent)
    x=BestStrat(hierarchy,pyramid,index);
else
    x=WorstStrat(hierarchy,pyramid,index);

end



end

