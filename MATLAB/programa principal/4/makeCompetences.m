function [pyramid]=makeCompetences(pyramid,levels,nc,delta,base,amplitude)



    pyramid(levels).competences=base+amplitude*rand(1,nc);

    for i=(levels-1):-1:1
        pyramid(i).competences=pyramid(i+1).competences*delta+rand(1,nc)*(1-delta);
    end
    
    for i=1:levels
        pyramid(i).responsibility=pyramid(i).responsibility/norm(pyramid(i).competences);
    end
    
end