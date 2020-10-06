function [eff]=efficiency(pyramid,hierarchy,i,j) %#ok<*DEFNU>
eff=dot(hierarchy(i,j).skills,pyramid(i).competences);
end
