function newQ = rowswap(Q, col)
%given a matrix and a column, swaps the rows of the matrix 
%so that the biggest enery in the column is at the top

m = numRows(Q)-1;

if (col <= m) && (col >= 1)
    %Find the row we want to swap
    pRow = col;
    pEntry = Q(col,col);
    for i = (col+1):(m+1)
        if Q(i,col) > pEntry
            pRow = i;
            pEntry = Q(i,col);
        end
    end

    %swap rows
    Q([col, pRow],:) = Q([pRow, col],:);
    newQ=Q;
elseif col == (m+1)
    newQ=Q;
else
    error(" 'col' should be an integer between 1 and m+1")
end
    
end