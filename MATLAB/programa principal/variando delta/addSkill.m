function [hierarchy]=addSkill(nc,pyramid,levels,hierarchy,gama)


for i=1:levels
    for j=1:pyramid(i).size
        
        if(hierarchy(i,j).full==1)
            
            for k=1:nc
%              
%                 if(hierarchy(i,j).skills(k)>1)
%                     fprintf("\nError in %d,%d, nc=%d",i,j,k);
%                     pause(100);
%                 end
                
                if(hierarchy(i,j).skills(k)<1)
                    
                    hierarchy(i,j).skills(k)=hierarchy(i,j).skills(k)+pyramid(i).competences(k)*gama;%/norm(pyramid(levels).competences);
                  
                    if(hierarchy(i,j).skills(k)>1)
                        hierarchy(i,j).skills(k)=1;
                    end
                  
                end
                
            end
            
        end
        
    end
    
end


end