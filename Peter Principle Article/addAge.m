function hierarchy = addAge(hierarchy,pyramid)
global levels

for i=1:levels
    for j=1:pyramid.position(i)
        if hierarchy.age(i,j)~=0 && hierarchy.age(i,j)~=-1
            hierarchy.age(i,j)=hierarchy.age(i,j)+1;
        end
    end
end

end

