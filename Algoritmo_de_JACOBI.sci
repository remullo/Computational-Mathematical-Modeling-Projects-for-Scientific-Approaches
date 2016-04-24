function [L, D, R, U, B]= jacobi(A, b, x0)
    
   [linhas colunas] = size(A);

    //INICIA AS MATRIZES L, D e R
    L = zeros(linhas,colunas); L_n = zeros(linhas,colunas);
    D = zeros(linhas,colunas); D_n = zeros(linhas,colunas);
    R = zeros(linhas,colunas); R_n = zeros(linhas,colunas);
    //PERCORRE A MATRIZ E CONSTROI L, D e R
    for i=1:1:linhas
        
        for j=1:1:colunas
            
            if(i>j) then
            L(i,j) = L(i,j) + A(i,j)
            end
            if(i==j) then
            D(i,j) = D(i,j) + A(i,j);
            end
            if (i<j) then
            R(i,j) = R(i,j) + A(i,j)
        end      
    end
end
//---------------------------------------------------------  

//-------NORMALIZAR---------------------
        for i=1:1:linhas
            for j=1:1:colunas
            L_n(i,j) = (L(i,j))/D(i,i);
            R_n(i,j) = (R(i,j))/D(i,i); 
            b_n(i,1) = (b(i,1))/D(i,i); 
            end  
        end 
        D_n = eye(linhas,colunas);    

 [lin_x col_x] = size(x0);
it = 1;
x_velho = x0;
//criar matriz para armazenar as variaveis:
X_vetores = zeros(lin_x,25)
X_vetores(:,1) = x_velho(:,1); 
x_velho = x0;
erro = 1;




//Criterio de convergencia com a matriz B
B = -(L_n+R_n)
//----CRITERIO DAS LINHAS
crit_linhas =1 
for i = 1:1:linhas
    somatorio = 0
    for j = 1:1:colunas
        if(i<>j) then
            somatorio = somatorio + B(i,j);
                if(j==colunas&somatorio<1) then
                    crit_linhas= crit_linhas + 1;
                        
                end
        end    
end
end
if (crit_linhas==linhas) then
    resposta_linhas = ["Converge (Critério das Linhas)!"]
    disp(resposta_linhas);
end
//---CRITERIO DAS COLUNAS 

crit_col =1 
for j = 1:1:colunas
    somatorio = 0
    for i = 1:1:linhas
        if(i<>j) then
            somatorio = somatorio + B(i,j);
                if(j==linhas&somatorio<1) then
                    crit_col= crit_col + 1;
                        
                end
        end    
end
end
if (crit_col==colunas) then
    resposta_colunas = ["Converge (Critério das Colunas)!"]
    disp(resposta_colunas);
end

//--------------------------------------------------

while(erro>=0.0001)
    
    U = (L_n+R_n)*x_velho
    x = b_n-U;
    x_velho = x;
    X_vetores(:,it+1) = x(:,1);
    erro = max(abs(X_vetores(:,it+1)-X_vetores(:,it)))/(max(abs((X_vetores(:,it+1)))));
    it= it+1; //quantidade de iterações
    disp(X_vetores);
    disp(erro);
end
    
endfunction



//Entradas e Chamada da função--------
x0 = [0.7 -1.6 0.6]';
A = [10 2 1; 1 5 1; 2 3 10];
b = [7 -8 6]';
[L D R U B]=jacobi(A,b,x0) 

