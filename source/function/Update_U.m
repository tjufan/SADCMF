function U = Update_U(lambda1, lambda3, lambda5, mu, eta, X, Q, U, V, A, J, Y, Bs, Ds)
    % Update variable U
    B = dotSeries(Bs); D = dotSeries(Ds);
    I = eye(size(A, 1));
    
    Delta = -lambda1*(B'*(X-B*U)) + ((lambda3+mu)*I+lambda5*(A*(A')))*(U.*V.*V) ...
        -(lambda3*(D*X)+lambda5*(A*Q)+mu*J-Y).*V;
    
   U = U - eta*Delta;
   U = normData(U);
end