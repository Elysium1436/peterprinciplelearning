function [indexChosen] = worst(pyramid,hierarchy,emptyList)

min=1000;

m=emptyList(1)+1;

for i=1:pyramid(m).size
    x(i)=(hierarchy(m,i).full);
end

if(all(x==0))
    %fprintf("Tem algo errado")
m=m+1;
end


for j=1:pyramid(m).size
   
    if(efficiency(pyramid,hierarchy,m,j)<min && hierarchy(m,j).full==1)
        indexChosen=[m,j];
        min=efficiency(pyramid,hierarchy,m,j);
    end

end

if(isempty(indexChosen))
    fprintf("Erro aqui")
end


end

