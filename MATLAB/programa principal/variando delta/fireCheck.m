function [hierarchy,emptyList]=fireCheck(pyramid,maxEfficiency,threshold,levels,hierarchy,emptyList,t)
count=1;

for i=1:levels

    for j=1:pyramid(i).size
        
        
        if(efficiency(pyramid,hierarchy,i,j)<threshold*maxEfficiency(i) || hierarchy(i,j).age>=60)
           
            hierarchy(i,j).full=0;
            emptyList(count,:)=[i,j];
            count=count+1;
        end
    end
    
end


end
