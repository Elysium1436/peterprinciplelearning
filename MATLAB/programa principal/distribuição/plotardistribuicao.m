function plotardistribuicao(DS,levels)

x=0:0.001:1;

hold on;



for i=1:levels
plot(x,DS(i,:), "-");
end

xlabel("Compet�ncia");
ylabel("Probabilidade");
legend("Primeiro N�vel","Segundo N�vel", "Terceiro N�vel", "Quarto N�vel", "Quinto N�vel", "Sexto N�vel");
legend('Location', 'northwest')
end

