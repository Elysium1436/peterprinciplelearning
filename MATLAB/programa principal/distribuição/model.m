function [ds] = model(delta,nc,threshold,levels,x,y,base,amplitude,timestep,gama)
a=0;


for i=1:levels
    pyramid(i).size = x(i); %#ok<*AGROW>
    pyramid(i).responsibility=y(i);
end


pyramid=makeCompetences(pyramid,levels,nc,delta,base,amplitude);
hierarchy=initialize(pyramid,levels,nc,0);

ds=bryanModel(pyramid,levels,hierarchy,timestep,threshold,nc,a,gama);






end

