//False Position method by Rêmullo Costa

function y = f(x);
    p = 3.5;
    y = (x ./ (1-x)) .* sqrt(2 * p./(2 + x)) - 0.04; //função a ser utilizada
endfunction


x = [0:0.01:0.1]; //valores de x para checar a função no gráfico

//plot da função
plot(x,f(x), '-o');
xgrid;

x_velho = 0.01; //chute inicial
x = 0.1;
erro = 1; //erro inicial para rodar a função
it = 1; //iteracão inicial
precisao = -2

while(erro >= 10^precisao)&it<200 do
    x_velho2 = x_velho;
    x_velho = x;
    secante = (f(x_velho)-f(x_velho2))/(x_velho-x_velho2)
    x = x_velho - (f(x_velho)/secante); //calcular o proximo x
    erro = abs((x-x_velho)/ x);
        disp([it x erro]);
    it = it+1;
end
