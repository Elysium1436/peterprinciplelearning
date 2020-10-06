function [hierarchy,emptyList] = promotion(hierarchy,indexChosen,emptyList)

hierarchy(emptyList(1),emptyList(2)).skills=hierarchy(indexChosen(1),indexChosen(2)).skills;
hierarchy(emptyList(1),emptyList(2)).age=hierarchy(indexChosen(1),indexChosen(2)).age;

hierarchy(indexChosen(1),indexChosen(2)).full=0;
hierarchy(emptyList(1),emptyList(2)).full=1;

emptyList=indexChosen;


end

