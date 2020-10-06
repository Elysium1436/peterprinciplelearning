function [x] = RandomStrat(hierarchy,pyramid,index,percent)
m=index(1)+1;
n=0;

if(rand()<=percent)
    x=WorstStrat(hierarchy,pyramid,index);
else
    x=BestStrat(hierarchy,pyramid,index);

end



end

