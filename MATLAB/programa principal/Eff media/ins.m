function [skill,age,full]=ins(nc,pyramid,level,a)

skill=zeros(1,nc);
for i=1:nc
    skill(i)=rand();
    if(skill(i)>1)
        skill(i)=1;
    end
    
    if(skill(i)<0)
        skill(i)=0;
    end
end

age=18 + randi([1,30]);
% if(age<18)
%     age=18;
% end
    

full=1;

end