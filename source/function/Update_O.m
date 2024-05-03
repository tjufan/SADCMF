function O = Update_O(lambda2, lambda6, alpha, beta, X, L, V, A, Cs)
    % Update variable O
    C = dotSeries(Cs);
    M = lambda2*beta*(L'*(C*V-alpha*X)*(X')*L)-lambda6*(A'*A);
    P = pinv( 1/(lambda2*beta*beta)*(pinv(L'*L)*M*pinv(L'*X*(X')*L)) );
    O = calInvVar(P);
end