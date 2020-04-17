function newQ = pivot(Q,k)
%zeros along column k using entry Q(k,k)
    m = numRows(Q)-1;
    P = eye(m+1);
    for i = (k+1):(m+1)
        P(i,k) = - Q(i,k) / Q(k,k);
    end
    newQ = P*Q;
end