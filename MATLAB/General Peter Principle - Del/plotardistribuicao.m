function plotardistribuicao(DS)
global levels;
x=0:0.001:1;

hold on;



for i=1:levels
plot(x,DS(i,:), "-");
end



end

