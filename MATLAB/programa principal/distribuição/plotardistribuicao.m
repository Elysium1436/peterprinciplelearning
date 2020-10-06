function plotardistribuicao(DS,levels)

x=0:0.001:1;

hold on;



for i=1:levels
plot(x,DS(i,:), "-");
end

xlabel("Competência");
ylabel("Probabilidade");
legend("Primeiro Nível","Segundo Nível", "Terceiro Nível", "Quarto Nível", "Quinto Nível", "Sexto Nível");
legend('Location', 'northwest')
end

