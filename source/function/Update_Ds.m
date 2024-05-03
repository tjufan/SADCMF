function Ds = Update_Ds( U, V, X, Ds )
    % Update variable Ds
    W = U .* V;
    Ds = calMidVar(W, X, Ds);
    
end