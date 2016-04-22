function y = f(x);
    y = x^3-5*x+1; //função a ser utilizada
endfunction

function dy = df(x);
    dy= 3*x^2-5;  //derivada da função
endfunction

x = [0:0.01:0.3]; //valores de x para checar a função no gráfico

//plot da função
plot(x,f(x), '-o');
xgrid;

x0 = 0.19; //chute inicial
erro = 1; //erro inicial para rodar a função
it = 1; //iteracão inicial
precisao = -2
x=x0;
while(erro >= 10^precisao)&it<200 do
    x_velho = x; //guardar o valor inicial de x
    x = x_velho - (f(x_velho)/df(x_velho)); //calcular o proximo x
    erro = abs((x-x_velho)/x);
    disp([it x erro]);
    it = it+1;
end


//limitaçoes do metodo de newton: picos e vales,raizes proximas a inflexoes
//proximas a min e max locais, chute inicial longe da raiz, derivada igual a zero
//derivada proxima de zero
//qt de valores iniciais, convergencia e vel, necessidades a mais