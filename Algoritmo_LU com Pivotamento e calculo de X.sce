
function [L, U, P, y, x] = LU(A, b)
    [linhas colunas] = size(A);
    U = A;
    L = zeros(linhas, colunas);
    P = eye(linhas, colunas);
    for j = 1:colunas
        pivo = U(j,j);
        //Pivotamento Parcial
        maiorLinha = j;
        for i = (j+1):linhas
            //Procurar o maior elemento em modulo abaixo do pivo
            if (abs(U(i,j)) > abs(U(maiorLinha,j))) then
                maiorLinha = i;
            end
        end
        //Trocar a linha do maior elemento pela linha do pivo
        aux = U(j, :);
        U(j,:) = U(maiorLinha, :);
        U(maiorLinha, :) = aux;
        //Trocas as linhas da Matriz L
        aux = L(j, :);
        L(j,:) = L(maiorLinha, :);
        L(maiorLinha, :) = aux;
        //Matriz de Permutacao
        aux = P(j, :);
        P(j,:) = P(maiorLinha, :);
        P(maiorLinha, :) = aux;
        //Atualizar o pivo apos a troca de linhas
        pivo = U(j,j) 
        for i = (j+1):linhas
            lambda = (U(i, j)/pivo);
            U(i, :) = U(i, :) - lambda * U(j,:);
            L(i, j) = lambda;
        end
    end
    L = L + eye(linhas, colunas)
    
    //----PERMUTACOES PARA CALCULAR LY E Ux
    Pb = P*b
 //--------
    //-------calcular os y da funçao (  LY = Pb)
    y(1) = Pb(1)/L(1,1);
    
    for i = 2:1:linhas //starts from the 2nd line till the last one 
       soma = 0; // sum starts from zero
       for j = 1:1:i-1  //j counter goes till i-1
        soma = soma + L(i,j)*y(j); //sums all factors
       end
       y(i)= (Pb(i)- soma)/L(i,i); //determines the solution in a vector of x values
    end
    
  //---------calcular os x da funçao (Ux = Y)
  
  for i = linhas:-1:1 //starts from the latest row 'till the first one.
        somatorio = 0; // sum is set to start from zero
        for j = i+1:linhas //now it will sum the terms of this line multiplied by the 'x'related
            somatorio = somatorio + U(i,j)*x(j);
        end
        x(i)= (y(i)- somatorio)/U(i,i); //for each iteration in rows, we find the current 'x' value
    end

    resultado = ['a solução é:' ]
    disp(resultado);
    disp(x);
       
    
endfunction

A = [3 -4 1; 1 2 2 ;4 0 -3]
b = [9; 3; -2]
[L U P y x]=LU(A, b) 

