function eff=efficiency(hierarchy,pyramid)
global levels
maxEfficiency=0;
eff=0;
for i=1:levels
    maxEfficiency=maxEfficiency+pyramid.responsibility(i)*pyramid.position(i);
end

for i=1:levels
    for j=1:pyramid.position(i)
        eff=eff+hierarchy.competence(i,j)*pyramid.responsibility(i);
    end
end


eff=eff/maxEfficiency;

        
end

