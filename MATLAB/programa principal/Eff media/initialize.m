function hierarchy=initialize(pyramid,levels,nc,a)



for i=1:levels
    for j=1:pyramid(i).size
        [hierarchy(i,j).skills,hierarchy(i,j).age,hierarchy(i,j).full]=ins(nc,pyramid,i,a);
       
    end
end



end