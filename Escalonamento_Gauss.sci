
function [Ab, P, sub] = gauss(A, b)
    [linhas colunas] = size(A);
    sub = zeros(linhas,colunas+1);
    P = eye(linhas,colunas);
 
//----------------------------------------------------------
//----------------------------------------------------------
//----------------------------------------------------------
    
   //----PIVOTAMENTO PARCIAL 
    for j = 1:colunas
        pivo = A(j,j);
        //Pivotamento Parcial
        maiorLinha = j;
        for i = (j+1):linhas
            //Procurar o maior elemento em modulo abaixo do pivo
            if (abs(A(i,j)) > abs(A(maiorLinha,j))) then
                maiorLinha = i;
            end
        end
        //Trocar a linha do maior elemento pela linha do pivo
        aux = A(j, :);
        A(j,:) = A(maiorLinha, :);
        A(maiorLinha, :) = aux;
        
        //Matriz de Permutacao
        aux = P(j, :);
        P(j,:) = P(maiorLinha, :);
        P(maiorLinha, :) = aux;
        //Atualizar o pivo apos a troca de linhas
        pivo = A(j,j)   
    end
    b_n = P*b;
//----------------------------------------------------------

//----------------------------------------------------------

//---------------------------------------------------------
 Ab = [A b_n]
[linha col] = size(A);

    for j = 1:col   //percorrer os pivos/ colunas

        for i = (j+1):1:linha//i = percorrer as linhas abaixo do pivo 
          sub = Ab(i,:) - (Ab(i,j)/A(j,j))*Ab(j,:);
          Ab(i,:) = sub;
         // disp(Ab(i,:));
             //zerar o elemento que esta na linha 'i' coluna 'j' 
        end
    end
function x = triangSup(A, b) //creates an upper matrix solving function
    
    for i = linha:-1:1 //starts from the latest row 'till the first one.
        somatorio = 0; // sum is set to start from zero
        for j = i+1:linha //now it will sum the terms of this line multiplied by the 'x'related
            somatorio = somatorio + Ab(i,j)*x(j);
        end
        x(i)= (Ab(i,$)- somatorio)/Ab(i,i); //for each iteration in rows, we find the current 'x' value
    end

    endfunction    
    
    
    
 //MATRIZ ESCALONADA   
 disp(Ab)
 //VETOR SOLUCAO X
 disp(triangSup(Ab, b_n)); 
endfunction


//========ENTRADAS PARA A MATRIZ A 
A = [ 2 4 1;6 2 -1; 3 2 8]
b = [2;3;4]
[Ab P] = gauss(A, b)





