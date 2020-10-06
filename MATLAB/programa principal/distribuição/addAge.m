function hierarchy=addAge(pyramid,levels,hierarchy)


for i=1:levels
   
    for j=1:pyramid(i).size
        
        if(hierarchy(i,j).full~=0)
        hierarchy(i,j).age=hierarchy(i,j).age+1;
        end
        
    end
   
end

end