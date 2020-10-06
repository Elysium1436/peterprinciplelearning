function [x] = RandomStrat(hierarchy,pyramid,index,percent)
m=index(1)+1;
n=0;


if(all(hierarchy.competence(m,1:pyramid.position(m))==0))
    m=m+1;
end


% if(rand<=percent)
%     x=WorstStrat(hierarchy,pyramid,index);
% else
%     x=BestStrat(hierarchy,pyramid,index);
% 
% end



n=randi([1,pyramid.position(m)]);

while(hierarchy.competence(m,n)==0)
    n=randi([1,pyramid.position(m)]);
end

x=[m,n];




end

