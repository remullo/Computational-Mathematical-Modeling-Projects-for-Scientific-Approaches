//Bolzano method by Rêmullo Costa 
function y = f(x)
    y = x^3-5*x+1;
endfunction

x = 0:0.1:3;
y = f(x);

plot(x,y);
xgrid;

a = 0.1; //ponto a avaliado por visualização grafica (point 'a' evaluated by graphical visualization)
b = 0.3; // ponto b avaliado por visualização grafica (point 'b' evaluated by graphical visualization)
x = a; //chute inicial (guess)
erro = 1; //erro inicial (1st error value)
iter = 1;
 =
while(erro > 10^-2) //A condição de parada é quando o erro for menor que 10ˆ-2 (stop condition is when the error is smaller than 10^-2)
   x_velho = x; //this variable saves the latest 'x', because it will be modified
   x = (a+b)/2;
   //Teorema de Bolzano
   if(f(a)*f(x)<0) then // se a raiz tiver entre a e x, entao x será o novo b (if the found root is between 'a' and 'x', thus, 'x' will be the new 'b'
       b = x;
    elseif(f(b)*f(x)<0) then //se a raiz estiver entre "b e x", então "x" será o novo a (if the root is in between of 'b' and 'x', then 'x' will be the new 'a'
        a = x;
    end
   
   //avaliar o erro no fim do loop para ver se a condição foi satisfeita (evaluate the error in the end of the loop to check if the condition were satisfied)
   erro = abs((x - x_velho)/x); 
   disp([iter x erro]);    
   iter = iter +1;

end

