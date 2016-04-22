//Upper matrix by Rêmullo Costa - - apr/2016
//solve problems and find the value of x by just giving the values for the matrix A and the 
// 'b' matrix (answer vector).

function Triangular(A, b) //THIS FUNCTION TAKES VALUES OF A MATRIX 'A' AND A 'b' ANSWER VECTOR AND 


//LOWER FUNCTION ----------------------------------------------------------------------

function x = triangInf(A, b) //creates an lower matrix solving function
    
    [linhas colunas] = size(A); // [rows columns] gets the size of the squared matrix
    x(1) = b(1)/A(1,1);
    
    for i = 2:1:linhas //starts from the 2nd line till the last one 
       soma = 0; // sum starts from zero
       for j = 1:1:i-1  //j counter goes till i-1
        soma = soma + A(i,j)*x(j); //sums all factors
       end
       x(i)= (b(i)- soma)/A(i,i); //determines the solution in a vector of x values
    end
   
endfunction //end of the triangInf function    
//------------------------------------------------------------------------------------- 


//UPPER FUNCTION ----------------------------------------------------------------------     
    function x = triangSup(A, b) //creates an upper matrix solving function
    
    [linhas colunas] = size(A); // [rows columns] gets the size of the squared matrix
    
    for i = linhas:-1:1 //starts from the latest row 'till the first one.
        somatorio = 0; // sum is set to start from zero
        for j = i+1:linhas //now it will sum the terms of this line multiplied by the 'x'related
            somatorio = somatorio + A(i,j)*x(j);
        end
        x(i)= (b(i)- somatorio)/A(i,i); //for each iteration in rows, we find the current 'x' value
    end

    endfunction //end of the TriangSup function
 
//------------------------------------------------------------------------------------- 
    
//SELECTS WHICH TYPE IS MORE APROPRIATED TO CALCULATE IT!------------------------------
if(A(1,2)==0) then
    ans = triangInf(A,b);
     disp(ans);
    else
    ans = triangSup(A,b);   
     disp(ans); 
end
//-------------------------------------------------------------------------------------

endfunction //end of the whole function
