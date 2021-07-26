//False Position method by Rêmullo Costa

function y = f(x);
    p = 3.5;
    y = (x ./ (1-x)) .* sqrt(2 * p./(2 + x)) - 0.04; //função a ser utilizada (fuction to be used - can be any function)
endfunction


x = [0:0.01:0.1]; //valores de x para checar a função no gráfico (velues of 'x' to check the function on the graphic)

//plot da função
plot(x,f(x), '-o');
xgrid;

x_velho = 0.01; //chute inicial (guess)
x = 0.1;
erro = 1; //erro inicial para rodar a função (initial error to run the function)
it = 1; //iteracão inicial
precisao = -2 //(accuracy)

while(erro >= 10^precisao)&it<200 do //if the error is bigger than the accuracy and the iteration is smaller than 200
    x_velho2 = x_velho; //save the first initial guess
    x_velho = x; //change the initial guess for x
    secante = (f(x_velho)-f(x_velho2))/(x_velho-x_velho2)
    x = x_velho - (f(x_velho)/secante); //calcular o proximo x
    erro = abs((x-x_velho)/ x);
        disp([it x erro]);
    it = it+1;
end
