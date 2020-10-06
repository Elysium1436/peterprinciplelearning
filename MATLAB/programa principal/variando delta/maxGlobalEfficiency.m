function s=maxGlobalEfficiency(pyramid,levels)
s=0;
for i=1:levels
    for j=1:pyramid(i).size
    s=s+sum(pyramid(i).competences)*pyramid(i).responsibility;
    end
    
end
