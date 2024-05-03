function V = Update_V(lambda2, lambda3, lambda5, mu, eta, T, X, Q, U, V, A, J, Y, Cs, Ds)
    % Update variable V
    C = dotSeries(Cs); D = dotSeries(Ds);
    I = eye(size(A, 1));
    
    Delta = -lambda2*(C'*(T-C*V)) + ((lambda3+mu)*I+lambda5*(A*(A')))*(V.*U.*U)...
        -(lambda3*(D*X)+lambda5*(A*Q)+mu*J-Y).*U;
    
    V = V - eta*Delta;
    V = normData(V);
end