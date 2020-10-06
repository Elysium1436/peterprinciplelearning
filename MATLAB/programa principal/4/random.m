function [indexChosen] = random(pyramid,hierarchy,emptyList)


m=emptyList(1)+1;


for i=1:pyramid(m).size
        x(i)=(hierarchy(m,i).full);
end

while(all(x==0))
    m=m+1;
    for i=1:pyramid(m).size
        x(i)=(hierarchy(m,i).full);
    end
end




% for j=1:pyramid(m).size
%    
%     if(efficiency(pyramid,hierarchy,m,j)>max && hierarchy(m,j).full==1)
%         indexChosen=[m,j];
%         max=efficiency(pyramid,hierarchy,m,j);
%     end
% 
% end

j=randi([1,pyramid(m).size]);

while(hierarchy(m,j).full==0)
    j=randi([1,pyramid(m).size]);
end
indexChosen=[m,j];

if(isempty(indexChosen))
    fprintf("Erro aqui")
end


end

