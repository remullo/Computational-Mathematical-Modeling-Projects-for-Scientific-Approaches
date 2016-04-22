//Bolzano method by Rêmullo Costa 
function y = f(x)
    y = x^3-5*x+1;
endfunction

x = 0:0.1:3;
y = f(x);

plot(x,y);
xgrid;

a = 0.1; //ponto a avaliado por visualização grafica
b = 0.3; // ponto b avaliado por visualização grafica
x = a; //chute inicial
erro = 1; //erro inicial
iter = 1;

while(erro > 10^-2) //A condição de parada é quando o erro for menor que 10ˆ-2
   x_velho = x;
   x = (a+b)/2;
   //Teorema de Bolzano
   if(f(a)*f(x)<0) then // se a raiz tiver entre a e x, entao x será o novo b
       b = x;
    elseif(f(b)*f(x)<0) then //se a raiz estiver entre "b e x", então "x" será o novo a
        a = x;
    end
   
   //avaliar o erro no fim do loop para ver se a condição foi satisfeita
   erro = abs((x - x_velho)/x); 
   disp([iter x erro]);    
   iter = iter +1;

end

