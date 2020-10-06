function [eff] = bryanModel(pyramid,levels,hierarchy,timestep,threshold,nc,a,gama)

for i=1:levels
    maxEfficiency(i)=sum(pyramid(i).competences); %#ok<AGROW>
end
emptyList(1,:)=[0,0];
mgb=maxGlobalEfficiency(pyramid,levels);
eff(1:timestep)=0;

for t=1:timestep
    
   [hierarchy,emptyList]=fireCheck(pyramid,maxEfficiency,threshold,levels,hierarchy,emptyList,t);
   cont=1;
   
   while(~all(emptyList==0))
     
       if(emptyList(cont,1)~=levels)
           indexChosen=best(pyramid,hierarchy,emptyList(cont,:));
           [hierarchy,emptyList(cont,:)]=promotion(hierarchy,indexChosen,emptyList(cont,:));
       
       
       else
       
           m=emptyList(cont,1);n=emptyList(cont,2);
           [hierarchy(m,n).skills,hierarchy(m,n).age,hierarchy(m,n).full]=ins(nc,pyramid,levels,a);
           emptyList(cont,:)=0;
           cont=cont+1;
       
       end
       
      
       
       
   end
    eff(t)=globalEfficiency(hierarchy,pyramid,levels,mgb);
    hierarchy=addAge(pyramid,levels,hierarchy);
    hierarchy=addSkill(nc,pyramid,levels,hierarchy,gama);
    
end



end

